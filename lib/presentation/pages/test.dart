import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';

import '../resources/assets_manager.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/linear_gradient_body.dart';

class TestScreen extends StatefulWidget {
  TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> with TickerProviderStateMixin {
  var _tabController;

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: 3, vsync: this);
    return LinearGradientBody(
      appbarTitle: 'Orders',
      showCart: false,
      onBackPressed: () {
        Navigator.of(context).pop();
      },
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      TabBar(
                        tabs: ['one', 'two', 'three'].map((e) => Text(e)).toList(),
                        controller: _tabController,
                        isScrollable: true,
                        indicator: BoxDecoration(border: null),
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                      ),
                      SizedBox(
                        height: 300,
                        child: TabBarView(
                            controller: _tabController,
                            physics: BouncingScrollPhysics(),
                            children: [
                              ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      SizedBox(width: 200, child: Text(index.toString())),
                                  separatorBuilder: (context, index) => SizedBox(
                                        width: 10,
                                      ),
                                  itemCount: 3),
                              ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      SizedBox(width: 200, child: Text(index.toString())),
                                  separatorBuilder: (context, index) => SizedBox(
                                        width: 10,
                                      ),
                                  itemCount: 3),
                              ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      SizedBox(width: 200, child: Text(index.toString())),
                                  separatorBuilder: (context, index) => SizedBox(
                                        width: 10,
                                      ),
                                  itemCount: 3),
                            ]),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
