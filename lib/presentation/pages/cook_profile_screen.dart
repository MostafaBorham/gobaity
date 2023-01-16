import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallabaity/domain/entities/requests_entites/food_entity.dart';
import 'package:yallabaity/injection_container.dart';
import 'package:yallabaity/network_layer/models/data_models/cook_model.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';

import 'package:yallabaity/presentation/manager/cubit_foods/foods_manager_cubit.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/circular_icon_button.dart';
import 'package:yallabaity/presentation/pages/food_details_screen.dart';
import 'package:yallabaity/presentation/widgets/horizontal_listview.dart';
import 'package:yallabaity/presentation/widgets/custom_bottom_sheet.dart';
import 'package:yallabaity/presentation/widgets/favourite_widget.dart';
import 'package:yallabaity/presentation/widgets/food_item.dart';
import 'package:yallabaity/presentation/widgets/search.dart';

import '../resources/routes_manager.dart';

class CookProfileScreen extends StatefulWidget {

  const CookProfileScreen({Key? key, this.cook}) : super(key: key);
  final CookModel? cook;

  @override
  State<CookProfileScreen> createState() => _CookProfileScreenState();
}

class _CookProfileScreenState extends State<CookProfileScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    List<String> categories = ['All', 'Chicken', 'Beef', 'Salad', 'Sandwich'];
    _tabController = TabController(length: categories.length, vsync: this);
    FoodEntity? topRatedFood;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(//set widgets vertically
          children: [
            _buildHeader(),
            Column(//set widgets vertically
              children: [
                SizedBox(
                  height: AppHeight.s25*Constants.height,
                ),
                Text(
                  'Mohamed Kitchen',
                  style: getMediumStyle(
                      color: ColorsManager.maximumPurple,
                      fontSize: AppWidth.s18*Constants.width),
                ),
                SizedBox(
                  height: AppHeight.s11*Constants.height,
                ),
                RatingBarIndicator(
                  rating: 3.3,
                  unratedColor: ColorsManager.graniteGray,
                  itemSize: AppWidth.s19*Constants.width,
                  itemCount: 5,
                  direction: Axis.horizontal,
                  itemBuilder: (context, index) => SvgPicture.asset(
                      AssetsManager.star,
                      color: ColorsManager.sunglow),
                  physics: BouncingScrollPhysics(),
                ),
                SizedBox(
                  height: AppHeight.s28*Constants.height,
                ),
                Text(
                  'You Have ordered from'+ '${widget.cook!.cookName} '+'Before',
                  textAlign: TextAlign.center,
                  style: getMediumStyle(
                      fontSize: AppWidth.s16*Constants.width,
                      color: ColorsManager.eerieBlack),
                ),
                SizedBox(
                  height: AppHeight.s25*Constants.height,
                ),
                Container(
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: Constants.margin),
                  padding: EdgeInsets.symmetric(vertical: AppWidth.s12*Constants.width),
                  decoration: BoxDecoration(
                      color: ColorsManager.maximumPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(45)),
                  child: RatingBar(
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    initialRating: 0,
                    itemCount: 5,
                    itemSize: AppWidth.s30*Constants.width,
                    itemPadding:
                        EdgeInsets.symmetric(horizontal: AppWidth.s11*Constants.width),
                    ratingWidget: RatingWidget(
                        full: SvgPicture.asset(AssetsManager.star,
                            color: ColorsManager.sunglow),
                        half: SvgPicture.asset(AssetsManager.outLinedstar,
                            color: ColorsManager.sunglow),
                        empty: SvgPicture.asset(AssetsManager.outLinedstar,
                            color: ColorsManager.sunglow)),
                    onRatingUpdate: (double value) {},
                  ),
                ),
                SizedBox(height:AppHeight.s11*Constants.height ,),
                Text(
                  'Give Rate',
                  textAlign: TextAlign.center,
                  style: getMediumStyle(
                      fontSize: AppWidth.s14*Constants.width,
                      color: ColorsManager.eerieBlack.withOpacity(0.73)),
                ),
                SizedBox(
                  height: AppHeight.s34*Constants.height,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Constants.margin),
                    child: Text('Top Rated',
                        style: getSemiBoldStyle(
                            color: ColorsManager.eerieBlack,
                            fontSize: AppWidth.s17*Constants.width)),
                  ),
                ),
                SizedBox(
                  height: AppHeight.s22*Constants.height,
                ),
                BlocConsumer<FoodsManagerCubit,FoodsManagerState>(
                  listener: (context,state){
                    if(state is TopRatedCookFoodLoadedState){
                      topRatedFood=state.food;
                    }
                  },
                  builder: (context,state)=>HorizontalListView(
                      itemCount: FoodModel.all.length,
                      itemBuilder: (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left:
                            index == 0 ? Constants.margin : AppWidth.s12*Constants.width,
                            right: index == FoodModel.all.length - 1
                                ? Constants.margin
                                : 0,
                          ),
                          child: FoodItem(
                            food: topRatedFood ,
                            width: AppWidth.s252*Constants.width,
                            isLoaded: state is TopRatedCookFoodLoadedState,
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.foodDetailsRoute, arguments: {
                                FoodDetailsScreen.foodIdKey:
                                topRatedFood
                              });
                            },
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: AppHeight.s50*Constants.height,
                ),
                TabBar(
                  isScrollable: true,
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  labelColor: ColorsManager.maximumPurple,
                  unselectedLabelColor: ColorsManager.black,
                  labelStyle: getSemiBoldStyle(
                      color: ColorsManager.black, fontSize: AppWidth.s14*Constants.width),
                  unselectedLabelStyle: getMediumStyle(
                      color: ColorsManager.white, fontSize: AppWidth.s14*Constants.width),
                  indicator: BoxDecoration(border: null),
                  controller: _tabController,
                  tabs: categories
                      .map((e) => Tab(
                            child: Text(
                              e,
                            ),
                          ))
                      .toList(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.3 *
                      FoodModel.all.length,
                  child: TabBarView(
                    controller: _tabController,
                    physics: BouncingScrollPhysics(),
                    children: categories.map((e) => _buildFoods()).toList(),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFoods() => Padding(
        padding: EdgeInsets.symmetric(horizontal: AppWidth.s29*Constants.width),
        child: ListView.separated(
          itemCount: FoodModel.all.length,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            return FoodItem(
              food: FoodModel.all[index],
              onTap: () {
                Navigator.of(context).pushNamed(Routes.foodDetailsRoute,
                    arguments: {
                      FoodDetailsScreen.foodIdKey: FoodModel.all[index]
                    });
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: AppHeight.s29*Constants.height,
          ),
        ),
      );

  _buildHeader() => Stack(
        children: [
          SizedBox(
            height: AppHeight.s155*Constants.height,
            width: double.maxFinite,
            child: Image.asset(
              AssetsManager.loginFood,
              fit: BoxFit.cover,
            ),
          ),
          Opacity(
            opacity: 0.2,
            child: Container(
              height: AppHeight.s173*Constants.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      ColorsManager.black.withOpacity(0.8),
                      ColorsManager.white.withOpacity(0.8)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 1]),
              ),
            ),
          ),
          Positioned.fill(
            top: AppHeight.s45*Constants.height,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    left: Constants.margin, right: AppWidth.s27*Constants.width),
                child: Row(// set widgets horizontally
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircularIconButton(
                      asset: AssetsManager.back,
                      color: ColorsManager.white,
                      ontap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    FavouriteWidget(
                      radius: AppWidth.s20*Constants.width,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
              bottom: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Constants.margin),
                  child: Search(
                    showFilter: true,
                    hintText: 'Search ',
                    onFilterPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: ColorsManager.transparent,
                        builder: (context) => const CustomBottomSheet(),
                      );
                    },
                  ),
                ),
              ))
        ],
      );
}
