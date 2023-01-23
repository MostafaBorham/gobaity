/*
import 'package:flutter/material.dart';
import 'package:yallabaity/application/app_api_constants/sorting_constants.dart';
import 'package:yallabaity/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallabaity/domain/entities/requests_entites/category_entity.dart';
import 'package:yallabaity/domain/entities/requests_entites/food_entity.dart';
import 'package:yallabaity/injection_container.dart';
import 'package:yallabaity/network_layer/models/data_models/category_model.dart';
import 'package:yallabaity/network_layer/models/data_models/cook_get_params_model.dart';
import 'package:yallabaity/network_layer/models/data_models/cook_model.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';
import 'package:yallabaity/network_layer/models/data_models/foods_get_params_model.dart';
import 'package:yallabaity/presentation/manager/bloc_categories/categories_bloc.dart';
import 'package:yallabaity/presentation/manager/bloc_foods/foods_bloc.dart';
import 'package:yallabaity/presentation/manager/cubit_cook_foods_manager/cubit_cook_foods_manager_cubit.dart';
import 'package:yallabaity/presentation/manager/cubit_food_manager/cubit_food_manager_cubit.dart';
import 'package:yallabaity/presentation/manager/cubit_foods/foods_manager_cubit.dart';
import 'package:yallabaity/presentation/pages/category_screen.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/category_item.dart';
import 'package:yallabaity/presentation/widgets/circular_icon_button.dart';
import 'package:yallabaity/presentation/pages/food_details_screen.dart';
import 'package:yallabaity/presentation/widgets/custom_circular_progressbar.dart';
import 'package:yallabaity/presentation/widgets/horizontal_listview.dart';
import 'package:yallabaity/presentation/widgets/custom_bottom_sheet.dart';
import 'package:yallabaity/presentation/widgets/favourite_widget.dart';
import 'package:yallabaity/presentation/widgets/food_item.dart';
import 'package:yallabaity/presentation/widgets/no_foods_ui.dart';
import 'package:yallabaity/presentation/widgets/search.dart';
import 'package:yallabaity/presentation/widgets/shimmer_widget.dart';
import 'package:yallabaity/presentation/widgets/tab_item.dart';

import '../resources/routes_manager.dart';

class CookProfileScreen extends StatefulWidget {
  CookProfileScreen({Key? key, this.cook}) : super(key: key);
  final CookModel? cook;

  @override
  State<CookProfileScreen> createState() => _CookProfileScreenState();
}

class _CookProfileScreenState extends State<CookProfileScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  List<CategoryEntity?> categories = [];
  List<FoodModel> topRatedFood = [];
  int defaultTabLength = 4;

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.cook!.cookName);
    debugPrint(widget.cook!.rate!.toString());
    _tabController = TabController(
        length: categories.isEmpty ? defaultTabLength : categories.length,
        vsync: this);

    return Scaffold(
      body: ListView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        children: [
          _buildHeader(),
          Column(
            //set widgets vertically
            children: [
              SizedBox(
                height: AppHeight.s25 * Constants.height,
              ),
              Text(
                widget.cook!.cookName! */
/*widget.cook!.cookName!*/ /*
,
                style: getMediumStyle(
                    color: ColorsManager.maximumPurple,
                    fontSize: AppWidth.s18 * Constants.width),
              ),
              SizedBox(
                height: AppHeight.s11 * Constants.height,
              ),
              RatingBarIndicator(
                rating: widget.cook!.rate!,
                unratedColor: ColorsManager.graniteGray,
                itemSize: AppWidth.s19 * Constants.width,
                itemCount: 5,
                direction: Axis.horizontal,
                itemBuilder: (context, index) => SvgPicture.asset(
                    AssetsManager.star,
                    color: ColorsManager.sunglow),
                physics: BouncingScrollPhysics(),
              ),
              SizedBox(
                height: AppHeight.s28 * Constants.height,
              ),
              Text(
                'You Have ordered from ${widget.cook!.cookName} Before',
                textAlign: TextAlign.center,
                style: getMediumStyle(
                    fontSize: AppWidth.s16 * Constants.width,
                    color: ColorsManager.eerieBlack),
              ),
              SizedBox(
                height: AppHeight.s25 * Constants.height,
              ),
              Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: Constants.margin),
                padding: EdgeInsets.symmetric(
                    vertical: AppWidth.s12 * Constants.width),
                decoration: BoxDecoration(
                    color: ColorsManager.maximumPurple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(45)),
                child: RatingBar(
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  initialRating: 0,
                  itemCount: 5,
                  itemSize: AppWidth.s30 * Constants.width,
                  itemPadding: EdgeInsets.symmetric(
                      horizontal: AppWidth.s11 * Constants.width),
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
              SizedBox(
                height: AppHeight.s11 * Constants.height,
              ),
              Text(
                'Give Rate',
                textAlign: TextAlign.center,
                style: getMediumStyle(
                    fontSize: AppWidth.s14 * Constants.width,
                    color: ColorsManager.eerieBlack.withOpacity(0.73)),
              ),
              SizedBox(
                height: AppHeight.s34 * Constants.height,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Constants.margin),
                  child: Text('Top Rated',
                      style: getSemiBoldStyle(
                          color: ColorsManager.eerieBlack,
                          fontSize: AppWidth.s17 * Constants.width)),
                ),
              ),
              SizedBox(
                height: AppHeight.s22 * Constants.height,
              ),
              BlocConsumer<CookFoodsManagerCubit, CookFoodsManagerState>(
                listener: (context, state) {
                  if (state is CookFoodsLoadedState) {
                    topRatedFood = state.cookFoods;
                  }
                },
                builder: (context, state) => HorizontalListView(
                    itemCount: topRatedFood.isEmpty ? 4 : topRatedFood.length,
                    itemBuilder: (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0
                              ? Constants.margin
                              : AppWidth.s12 * Constants.width,
                          right: index + 1 == topRatedFood.length
                              ? Constants.margin
                              : 0,
                        ),
                        child: FoodItem(
                          food:
                              topRatedFood.isEmpty ? null : topRatedFood[index],
                          width: AppWidth.s200 * Constants.width,
                          isLoaded: state is CookFoodsLoadedState,
                          onFavouriteBtnPressed: (value) {
                            setState(() {
                              FoodModel.all[index].isFavorited = value;
                            });
                          },
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(Routes.foodDetailsRoute, arguments: {
                              FoodDetailsScreen.foodIdKey: topRatedFood
                            });
                          },
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: AppHeight.s50 * Constants.height,
              ),
              BlocBuilder<CategoriesBloc, CategoriesState>(
                builder: (context, state) {
                  if (state is LoadedState) {
                    categories = state.categories;
                    _tabController!.length != categories.length;
                  }
                  return Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        labelColor: ColorsManager.maximumPurple,
                        unselectedLabelColor: ColorsManager.black,
                        labelStyle: getSemiBoldStyle(
                            color: ColorsManager.black,
                            fontSize: AppWidth.s14 * Constants.width),
                        unselectedLabelStyle: getMediumStyle(
                            color: ColorsManager.white,
                            fontSize: AppWidth.s14 * Constants.width),
                        indicator: CircleTabIndicator(
                            color: ColorsManager.maximumPurple, radius: 3),
                        controller: _tabController,
                        tabs: List.generate(
                            categories.isEmpty
                                ? defaultTabLength
                                : categories.length,
                            (index) => TabItem(
                                  isLoaded: state is LoadedState,
                                  category: state is LoadedState
                                      ? categories[index]
                                      : null,
                                  index: index,
                                )),
                      ),
                      SizedBox(
                        height: AppHeight.s200 * Constants.height * 50,
                        child: TabBarView(
                          controller: _tabController,
                          physics: BouncingScrollPhysics(),
                          children: List.generate(
                              categories.isEmpty
                                  ? defaultTabLength
                                  : categories.length,
                              (index) => _buildFoods(
                                  context,
                                  state is LoadedState
                                      ? categories[index]!
                                      : null)),
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildFoods(context, CategoryEntity? category) {
    if (category != null) {
      BlocProvider.of<FoodsBloc>(context).add(GetAllFoodsEvent(
          foodsGetParamsModel:
              FoodsGetParamsModel(categoryId: category.categoryId!)));
    }
    return BlocBuilder<FoodsBloc, FoodsState>(
        builder: (context, state) => Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                child: Column(
                  children: List<Widget>.generate(
                      state is LoadedFoodsState
                          ? state.foods.length
                          : defaultTabLength,
                      (index) => Padding(
                            padding: EdgeInsets.only(
                              bottom: AppHeight.s10 * Constants.height,
                              left: index == 0
                                  ? Constants.margin
                                  : AppWidth.s12 * Constants.width,
                              right: index == topRatedFood.length - 1
                                  ? Constants.margin
                                  : 0,
                            ),
                            child: SizedBox(
                              height: AppHeight.s200 * Constants.height,
                              child: FoodItem(
                                food: state is LoadedFoodsState
                                    ? state.foods[index]
                                    : null,
                                isLoaded: state is LoadedFoodsState,
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      Routes.foodDetailsRoute,
                                      arguments: {
                                        FoodDetailsScreen.foodIdKey:
                                            FoodModel.all[index]
                                      });
                                },
                              ),
                            ),
                          )),
                ),
              ),
            ));
  }

  _buildHeader() => Stack(
        children: [
          SizedBox(
            height: AppHeight.s155 * Constants.height,
            width: double.maxFinite,
            child: Image.asset(
              AssetsManager.loginFood,
              fit: BoxFit.cover,
            ),
          ),
          Opacity(
            opacity: 0.2,
            child: Container(
              height: AppHeight.s173 * Constants.height,
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
            top: AppHeight.s45 * Constants.height,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    left: Constants.margin,
                    right: AppWidth.s27 * Constants.width),
                child: Row(
                  // set widgets horizontally
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
                      radius: AppWidth.s20 * Constants.width,
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
                  padding: EdgeInsets.symmetric(horizontal: Constants.margin),
                  child: Search(
                    showFilter: true,
                    hintText: 'Search ',
                    onChanged: (keySearch) async {
                      _scrollController.animateTo(Constants.height * 0.5,
                          duration: Duration(milliseconds: Constants.d2),
                          curve: Curves.linear);
*/
/*                      await CookFoodsManagerCubit.getCookFoodsEvent(context,
                          cookGetParams: CookGetParamsModel(order: keySearch,providerId: 2,));*/ /*

                    },
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
}*/
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:yallabaity/application/app_api_constants/sorting_constants.dart';
import 'package:yallabaity/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallabaity/domain/entities/requests_entites/category_entity.dart';
import 'package:yallabaity/domain/entities/requests_entites/food_entity.dart';
import 'package:yallabaity/injection_container.dart';
import 'package:yallabaity/network_layer/models/data_models/category_model.dart';
import 'package:yallabaity/network_layer/models/data_models/cook_get_params_model.dart';
import 'package:yallabaity/network_layer/models/data_models/cook_model.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';
import 'package:yallabaity/network_layer/models/data_models/foods_get_params_model.dart';
import 'package:yallabaity/presentation/manager/cubit_categories/categories_manager_cubit.dart';
import 'package:yallabaity/presentation/manager/cubit_cook_foods_manager/cubit_cook_foods_manager_cubit.dart';
import 'package:yallabaity/presentation/manager/cubit_foods/foods_manager_cubit.dart';
import 'package:yallabaity/presentation/pages/category_screen.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/category_item.dart';
import 'package:yallabaity/presentation/widgets/circular_icon_button.dart';
import 'package:yallabaity/presentation/pages/food_details_screen.dart';
import 'package:yallabaity/presentation/widgets/custom_circular_progressbar.dart';
import 'package:yallabaity/presentation/widgets/horizontal_listview.dart';
import 'package:yallabaity/presentation/widgets/custom_bottom_sheet.dart';
import 'package:yallabaity/presentation/widgets/favourite_widget.dart';
import 'package:yallabaity/presentation/widgets/food_item.dart';
import 'package:yallabaity/presentation/widgets/no_foods_ui.dart';
import 'package:yallabaity/presentation/widgets/search.dart';
import 'package:yallabaity/presentation/widgets/shimmer_widget.dart';
import 'package:yallabaity/presentation/widgets/tab_item.dart';

import '../resources/routes_manager.dart';

class CookProfileScreen extends StatefulWidget {
  CookProfileScreen({Key? key, this.cook}) : super(key: key);
  final CookModel? cook;

  @override
  State<CookProfileScreen> createState() => _CookProfileScreenState();
}

class _CookProfileScreenState extends State<CookProfileScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  BuildContext? topRatedContext;
  BuildContext? foodsCategoryContext;
  List<CategoryEntity?> categories = [];
  List<FoodEntity> topRatedFoods = [];
  final _searchController = TextEditingController();
  int defaultTabLength = 4;

  ///this for default length of tabBarController in case if categories not exist
  int currentFoodsLength = 4;

  ///this for length of current foods list that selected in tabBarView
  CategoryEntity? currentCategory;

  ///this for current selected category tab bar

  final _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    developer.log(widget.cook!.cookName.toString());
    developer.log(widget.cook!.cookId.toString());
    developer.log(widget.cook!.rate.toString());
    developer.log(widget.cook!.rateCount.toString());
    developer.log(widget.cook!.gender.toString());
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.cook!.cookName);
    debugPrint(widget.cook!.rate!.toString());
    _tabController = TabController(
        length: categories.isEmpty ? defaultTabLength : categories.length,
        vsync: this);
    debugPrint("user id ${widget.cook!.cookId}");
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => di.getIt<CookFoodsManagerCubit>()
              ..getCookFoods(
                  cookGetParams:
                      CookGetParamsModel(providerId: widget.cook!.cookId))),
        BlocProvider(
            create: (context) => di.getIt<CategoriesManagerCubit>()
              ..getUserCategories(widget.cook!.cookId!)),
        BlocProvider(create: (context) => di.getIt<FoodsManagerCubit>()),
      ],
      child: Scaffold(
        body: ListView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          children: [
            _buildHeader(),
            Column(
              //set widgets vertically
              children: [
                SizedBox(
                  height: AppHeight.s25 * Constants.height,
                ),
                Text(
                  widget.cook!.cookName! /*widget.cook!.cookName!*/,
                  style: getMediumStyle(
                      color: ColorsManager.maximumPurple,
                      fontSize: AppWidth.s18 * Constants.width),
                ),
                SizedBox(
                  height: AppHeight.s11 * Constants.height,
                ),
                RatingBarIndicator(
                  rating: widget.cook!.rate!,
                  unratedColor: ColorsManager.graniteGray,
                  itemSize: AppWidth.s19 * Constants.width,
                  itemCount: 5,
                  direction: Axis.horizontal,
                  itemBuilder: (context, index) => SvgPicture.asset(
                      AssetsManager.star,
                      color: ColorsManager.sunglow),
                  physics: BouncingScrollPhysics(),
                ),
                SizedBox(
                  height: AppHeight.s28 * Constants.height,
                ),
                Text(
                  'You Have ordered from ${widget.cook!.cookName} Before',
                  textAlign: TextAlign.center,
                  style: getMediumStyle(
                      fontSize: AppWidth.s16 * Constants.width,
                      color: ColorsManager.eerieBlack),
                ),
                SizedBox(
                  height: AppHeight.s25 * Constants.height,
                ),
                Container(
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: Constants.margin),
                  padding: EdgeInsets.symmetric(
                      vertical: AppWidth.s12 * Constants.width),
                  decoration: BoxDecoration(
                      color: ColorsManager.maximumPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(45)),
                  child: RatingBar(
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    initialRating: 0,
                    itemCount: 5,
                    itemSize: AppWidth.s30 * Constants.width,
                    itemPadding: EdgeInsets.symmetric(
                        horizontal: AppWidth.s11 * Constants.width),
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
                SizedBox(
                  height: AppHeight.s11 * Constants.height,
                ),
                Text(
                  'Give Rate',
                  textAlign: TextAlign.center,
                  style: getMediumStyle(
                      fontSize: AppWidth.s14 * Constants.width,
                      color: ColorsManager.eerieBlack.withOpacity(0.73)),
                ),
                SizedBox(
                  height: AppHeight.s34 * Constants.height,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: Constants.margin),
                    child: Text('Top Rated',
                        style: getSemiBoldStyle(
                            color: ColorsManager.eerieBlack,
                            fontSize: AppWidth.s17 * Constants.width)),
                  ),
                ),
                SizedBox(
                  height: AppHeight.s22 * Constants.height,
                ),
                BlocConsumer<CookFoodsManagerCubit, CookFoodsManagerState>(
                  listener: (context, state) {
                    if (state is CookFoodsLoadedState) {
                      topRatedFoods = state.cookFoods;
                    }
                  },
                  builder: (context, state) {
                    topRatedContext=context;
                    developer.log(state.toString());
                    return state is CookFoodsLoadedState &&
                        topRatedFoods.isEmpty
                        ? const NoFoodsUi()
                        : HorizontalListView(
                        itemCount: topRatedFoods.isEmpty
                            ? 4
                            : topRatedFoods.length,
                        itemBuilder: (index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: index == 0
                                  ? Constants.margin
                                  : AppWidth.s12 * Constants.width,
                              right: index + 1 == topRatedFoods.length
                                  ? Constants.margin
                                  : 0,
                            ),
                            child: FoodItem(
                              food: topRatedFoods.isEmpty
                                  ? null
                                  : topRatedFoods[index],
                              width: AppWidth.s200 * Constants.width,
                              isLoaded: state is CookFoodsLoadedState,
                              onFavouriteBtnPressed: (value) {
                                setState(() {
                                  FoodModel.all[index].isFavorited =
                                      value;
                                });
                              },
                              onTap: () {
                                //  FoodManagerCubit.getFoodByIdEvent(context, foods![index].foodId!);

                                // CookFoodsManagerCubit.getCookFoodsEvent(context,
                                //     cookGetParams: CookGetParamsModel(providerId: foods![index].userId!));
                                Navigator.pushNamed(
                                    context, Routes.foodDetailsRoute,
                                    arguments: {
                                      FoodDetailsScreen.foodIdKey:
                                      topRatedFoods[index].foodId,
                                      FoodDetailsScreen.providerIdKey:
                                      topRatedFoods[index].userId
                                    });
                              },
                            ),
                          );
                        });
                  },
                ),
                SizedBox(
                  height: AppHeight.s50 * Constants.height,
                ),
                BlocConsumer<CategoriesManagerCubit, CategoriesManagerState>(
                  listener: (context, state) {
                    if (state is CategoriesLoadedState) {
                      categories = state.categories;
                      _tabController!.length != categories.length;
                      currentCategory = categories.first;
                      BlocProvider.of<FoodsManagerCubit>(foodsCategoryContext!).getFoods(
                          foodGetParams: FoodsGetParamsModel(
                              categoryId: currentCategory!.categoryId!,
                              foodName: _searchController.text));
                      developer.log('categories = $categories');
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          padding: EdgeInsets.zero,
                          physics: BouncingScrollPhysics(),
                          labelColor: ColorsManager.maximumPurple,
                          unselectedLabelColor: ColorsManager.black,
                          labelStyle: getSemiBoldStyle(
                              color: ColorsManager.black,
                              fontSize: AppWidth.s14 * Constants.width),
                          unselectedLabelStyle: getMediumStyle(
                              color: ColorsManager.white,
                              fontSize: AppWidth.s14 * Constants.width),
                          indicator: CircleTabIndicator(
                              color: ColorsManager.maximumPurple, radius: 3),
                          controller: _tabController,
                          onTap: (index) {
                            if (_tabController!.indexIsChanging) {
                              developer.log('tabbed = $index');
                              currentCategory = categories[index];
                              BlocProvider.of<FoodsManagerCubit>(foodsCategoryContext!)
                                  .getFoods(
                                  foodGetParams: FoodsGetParamsModel(
                                      categoryId:
                                      currentCategory!.categoryId!,
                                      foodName: _searchController.text));
                            }
                          },
                          tabs: List.generate(
                              categories.isEmpty
                                  ? defaultTabLength
                                  : categories.length,
                                  (index) => TabItem(
                                isLoaded: state is CategoriesLoadedState,
                                category: state is CategoriesLoadedState
                                    ? categories[index]
                                    : null,
                                index: index,
                              )),
                        ),
                        BlocConsumer<FoodsManagerCubit, FoodsManagerState>(
                          listener: (context, foodState) {
                            if (foodState is FoodsLoadedState) {
                              currentFoodsLength = foodState.foods.length;
                            }
                          },
                          builder: (context, foodState) {
                            foodsCategoryContext=context;
                            return SizedBox(
                              height: (AppHeight.s220 *
                                  Constants.height *
                                  currentFoodsLength) +
                                  (AppHeight.s80 * Constants.height),
                              child: TabBarView(
                                controller: _tabController,
                                physics: BouncingScrollPhysics(),
                                children: List.generate(
                                    categories.isEmpty
                                        ? defaultTabLength
                                        : categories.length,
                                        (index) => _buildFoods(
                                        context,
                                        state is CategoriesLoadedState
                                            ? categories[index]!
                                            : null,
                                        foodState)),
                              ),
                            );
                          },
                        )
                      ],
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFoods(context, CategoryEntity? category, foodState) {
    bool isCurrentCategory = category == currentCategory;
    return foodState is FoodsLoadedState && foodState.foods.isEmpty && isCurrentCategory
        ? const NoFoodsUi()
        : Column(
            children: List<Widget>.generate(
                foodState is FoodsLoadedState && isCurrentCategory
                    ? foodState.foods.length
                    : currentFoodsLength,
                (index) => Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: AppWidth.s20 * Constants.width,
                          vertical: AppHeight.s10 * Constants.height),
                      height: AppHeight.s200 * Constants.height,
                      child: FoodItem(
                        food: foodState is FoodsLoadedState && isCurrentCategory
                            ? foodState.foods[index]
                            : null,
                        isLoaded:
                            foodState is FoodsLoadedState && isCurrentCategory,
                        onTap: () {
                          //  FoodManagerCubit.getFoodByIdEvent(context, foods![index].foodId!);

                          // CookFoodsManagerCubit.getCookFoodsEvent(context,
                          //     cookGetParams: CookGetParamsModel(providerId: foods![index].userId!));
                          Navigator.pushNamed(
                              context, Routes.foodDetailsRoute,
                              arguments: {
                                FoodDetailsScreen.foodIdKey:
                                topRatedFoods[index].foodId,
                                FoodDetailsScreen.providerIdKey:
                                topRatedFoods[index].userId
                              });
                        },
                      ),
                    )),
          );
  }

  _buildHeader() => Stack(
        children: [
          SizedBox(
            height: AppHeight.s155 * Constants.height,
            width: double.maxFinite,
            child: Image.asset(
              AssetsManager.loginFood,
              fit: BoxFit.cover,
            ),
          ),
          Opacity(
            opacity: 0.2,
            child: Container(
              height: AppHeight.s173 * Constants.height,
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
            top: AppHeight.s45 * Constants.height,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    left: Constants.margin,
                    right: AppWidth.s27 * Constants.width),
                child: Row(
                  // set widgets horizontally
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
                      radius: AppWidth.s20 * Constants.width,
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
                  padding: EdgeInsets.symmetric(horizontal: Constants.margin),
                  child: Search(
                    showFilter: true,
                    hintText: 'Search ',
                    controller: _searchController,
                    onChanged: (keySearch) async {
                      _scrollController.animateTo(Constants.height * 0.5,
                          duration: Duration(milliseconds: Constants.d2),
                          curve: Curves.linear);
                      CookFoodsManagerCubit.getCookFoodsEvent(topRatedContext!,
                          cookGetParams: CookGetParamsModel(
                              providerId: widget.cook!.cookId, foodName: keySearch));
                      FoodsManagerCubit.getFoodsEvent(foodsCategoryContext!,
                          foodGetParams: FoodsGetParamsModel(
                              categoryId: currentCategory!.categoryId!,
                              foodName: keySearch));
                    },
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
