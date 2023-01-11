import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:yallabaity/application/utils.dart';
import 'package:yallabaity/domain/entities/requests_entites/food_entity.dart';
import 'package:yallabaity/network_layer/models/data_models/category_model.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';
import 'package:yallabaity/network_layer/models/data_models/foods_get_params_model.dart';
import 'package:yallabaity/network_layer/models/item_model.dart';
import 'package:yallabaity/presentation/manager/cubit_foods/foods_manager_cubit.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/routes_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/icon_button.dart';
import 'package:yallabaity/presentation/widgets/mycart.dart';
import 'package:yallabaity/presentation/pages/food_details_screen.dart';
import 'package:yallabaity/presentation/widgets/custom_appbar.dart';
import 'package:yallabaity/presentation/widgets/custom_bottom_sheet.dart';
import 'package:yallabaity/presentation/widgets/custom_multiple_list_checkbox.dart';
import 'package:yallabaity/presentation/widgets/custom_single_list_checkbox.dart';
import 'package:yallabaity/presentation/widgets/custom_tabbar_widget.dart';
import 'package:yallabaity/presentation/widgets/food_item.dart';
import 'package:yallabaity/presentation/widgets/search.dart';

import '../../application/app_api_constants/sorting_constants.dart';
import '../widgets/custom_circular_progressbar.dart';

class SeeAllScreen extends StatefulWidget {
  static const categoryName = 'category name';
  static const sectionName = 'section name';

  const SeeAllScreen({super.key});
  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> with TickerProviderStateMixin {
  bool showBottom = false;
  CategoryModel? category;
  String sectionName = '';
  BuildContext? foodsBlocContext;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    if (data != null) {
      category = data[SeeAllScreen.categoryName] as CategoryModel;
      sectionName = data[SeeAllScreen.sectionName];
    }
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: ColorsManager.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.margin),
        child: Column(//set widgets vertically
          children: [
            SizedBox(
              height: AppHeight.s19 * Constants.height,
            ),
            Search(
              hintText: 'Search',
              showFilter: true,
              onFilterPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: ColorsManager.transparent,
                  builder: (context) => const CustomBottomSheet(),
                );
              },
            ),
            SizedBox(
              height: AppHeight.s28 * Constants.height,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppWidth.s7 * Constants.width),
                child: _buildFoods(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildAppBar(BuildContext context) => CustomAppBar(
      backgroundColor: ColorsManager.maximumPurple,
      showBackgroundImage: true,
      prefix: CustomIconButton(
        asset: AssetsManager.back,
        color: ColorsManager.white,
        height: AppWidth.s20 * Constants.width,
        width: AppWidth.s11 * Constants.width,
        onTap: () {
          Navigator.pop(context);
        },
      ),
      subtitleColor: ColorsManager.white,
      title: sectionName,
      subtitle: 'In ${category!.categoryName!}',
      suffix: MyCart(onTap: () {
        Navigator.pushNamed(context, Routes.cartRoute);
      }));
  _buildFoods() => BlocBuilder<FoodsManagerCubit, FoodsManagerState>(
        builder: (context, foodsState) {
          foodsBlocContext = context;
         debugPrint('fooooooooooooood state is ${foodsState.runtimeType}');
          if (foodsState is FoodsLoadedState || foodsState is LoadingMoreFoodsState || foodsState is AllFoodAreLoaded) {
            List<FoodEntity> foods = [];
            if (foodsState is FoodsLoadedState) {
              foods = foodsState.foods;
            }
            if (foodsState is LoadingMoreFoodsState) {
              foods = foodsState.foods;
            }
            if (foodsState is AllFoodAreLoaded) {
              foods = foodsState.foods;
            }
            if (foods.isEmpty) {
              return SizedBox(
                height: AppHeight.s200 * Constants.height,
                width: AppWidth.s200 * Constants.width,
                child: Lottie.asset(AssetsManager.empty),
              );
            }
            return Container(
              color: ColorsManager.white,
              child: NotificationListener(
                onNotification: (notification) {
                  if (notification is ScrollEndNotification) {
                    if (notification.metrics.maxScrollExtent - notification.metrics.extentBefore < 600) {
                      //load more from server
                     debugPrint('load more from server');
                      FoodsManagerCubit.getMoreFoodsEvent(context);
                    }
                  }
                  return true;
                },
                child: RefreshIndicator(
                  onRefresh: ()async =>await FoodsManagerCubit.getFoodsEvent(context, foodGetParams:FoodsGetParamsModel(
                    categoryId: category!.categoryId!,
                    page: 0,
                    order: Sorting.mostPopular,
                  )) ,
                  child: ListView.separated(
                    itemCount: foods.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    primary: true,
                    itemBuilder: (context, index) {
                      return Column(//set widgets vertically
                        children: [
                          FoodItem(
                            food: foods[index],
                            width: AppWidth.s299 * Constants.width,
                            isLoaded: true,
                            onTap: () {
                              Navigator.pushNamed(context, Routes.foodDetailsRoute, arguments: {
                                FoodDetailsScreen.foodIdKey: foods[index].foodId,
                                FoodDetailsScreen.providerIdKey: foods[index].userId
                              });
                            },
                          ),
                          if (foodsState is LoadingMoreFoodsState && index + 1 == foods.length)
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: AppHeight.s20 * Constants.height),
                              child: CustomCircularProgressbar(
                                radius: AppHeight.s20 * Constants.height,
                              ),
                            ),
                          if (foodsState is AllFoodAreLoaded && index + 1 == foods.length)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: Constants.margin),
                              child: Text('All foods Are Loaded'),
                            ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => SizedBox(height: AppHeight.s10 * Constants.height),
                  ),
                ),
              ),
            );
          }
          return Container(
            color: ColorsManager.white,
            child: ListView.separated(
              itemCount: 4,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return FoodItem(
                  food: null,
                  width: AppWidth.s252 * Constants.width,
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(Routes.foodDetailsRoute, arguments: {FoodDetailsScreen.foodIdKey: FoodModel.all[index]});
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(height: AppHeight.s38 * Constants.height),
            ),
          );
        },
      );
}
