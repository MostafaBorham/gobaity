import 'package:flutter/material.dart';
import 'package:yallabaity/domain/entities/requests_entites/food_entity.dart';
import 'package:yallabaity/network_layer/models/data_models/food_model.dart';
import 'package:yallabaity/network_layer/models/food_status.dart';
import 'package:yallabaity/network_layer/models/item_model.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/cart_item.dart';
import 'package:yallabaity/presentation/widgets/gradient_background.dart';
import 'package:yallabaity/presentation/widgets/linear_gradient_body.dart';
import 'package:yallabaity/presentation/widgets/custom_tabbar_widget.dart';
import 'package:yallabaity/presentation/widgets/tabbar_item_widget.dart';
import 'package:yallabaity/network_layer/models/item_model.dart';

class MyFoodScreen extends StatefulWidget {
  MyFoodScreen({Key? key}) : super(key: key);

  @override
  State<MyFoodScreen> createState() => _MyFoodScreenState();
}

class _MyFoodScreenState extends State<MyFoodScreen>
    with TickerProviderStateMixin {
  List<ItemModel> tabs = [
    ItemModel(title: 'Active', active: true),
    ItemModel(title: 'Pending'),
  ];
  List<FoodStatus> list = [
    FoodStatus(date: 'Yesterday', list: FoodModel.all),
    FoodStatus(date: '3 days ago', list: FoodModel.all),
  ];
  TabController? _tabController;
  int currentPage = 0;
  PageController _pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
   debugPrint('sssss');
    _tabController = TabController(length: tabs.length, vsync: this);
    return LinearGradientBody(
      appbarTitle: 'My Foods',
      showCart: false,
      onBackPressed: () {
        Navigator.pop(context);
      },
      child: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(//set widgets vertically
            children: [
              SizedBox(
                height: AppHeight.s20*Constants.height,
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Constants.margin),
                  child: _buildTabBar()),
              SizedBox(
                height: AppHeight.s20*Constants.height,
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    changeItem(index);
                  },
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      physics: BouncingScrollPhysics(),
                      itemCount: list.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(
                            left: Constants.margin,
                            right: Constants.margin,
                            bottom:
                                index + 1 == list.length ? AppHeight.s100*Constants.height : 0,
                            top: index == 0 ? AppHeight.s12*Constants.height : 0),
                        child: Column(//set widgets vertically
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list[index].date!,
                              style: getSemiBoldStyle(
                                  fontSize: AppWidth.s17*Constants.width,
                                  color: ColorsManager.eerieBlack),
                            ),
                            SizedBox(
                              height: AppHeight.s12*Constants.height,
                            ),
                            _buildItems(index)
                          ],
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: AppHeight.s19*Constants.height,
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      physics: BouncingScrollPhysics(),
                      itemCount: list.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(
                            left: Constants.margin,
                            right: Constants.margin,
                            bottom:
                                index + 1 == list.length ? AppHeight.s100*Constants.height : 0,
                            top: index == 0 ? AppHeight.s12*Constants.height : 0),
                        child: Column(//set widgets vertically
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list[index].date!,
                              style: getSemiBoldStyle(
                                  fontSize: AppWidth.s17*Constants.width,
                                  color: ColorsManager.eerieBlack),
                            ),
                            SizedBox(
                              height: AppHeight.s12*Constants.height,
                            ),
                            _buildItems(index)
                          ],
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: AppHeight.s19*Constants.height,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildTabBar() => CustomTabBarWidget(
        itemCount: tabs.length,
        itemBuilder: (index) {
          return CustomTabBarItemWidget(
            tab: tabs[index],
            onTap: () {
              changeItem(index);
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            },
          );
        },
      );

  void changeItem(index) {
   debugPrint(tabs[index].hashCode.toString());

    setState(() {
      if (index != currentPage) {
       debugPrint(index);

        tabs[currentPage].active = false;
        tabs[index].active = !tabs[index].active;
        currentPage = index;
      }
    });
  }

  _buildItems(int index) => ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: list[index].list!.length,
        itemBuilder: (context, i) => Padding(
          padding: EdgeInsets.symmetric(horizontal: AppWidth.s17*Constants.width),
          child: CartItem(
            showCountAndDeleteItem: false,
            item: list[index].list![i],
          ),
        ),
        separatorBuilder: (BuildContext context, int i) => SizedBox(
          height: AppHeight.s19*Constants.height,
        ),
      );
}
