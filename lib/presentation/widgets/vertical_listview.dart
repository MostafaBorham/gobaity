import 'package:flutter/cupertino.dart';

class VerticalListView extends StatelessWidget {
  late int _itemCount;
  late Widget Function(int index) _itemBuilder;
  ScrollController? _scrollController;
  VerticalListView(
      {super.key, required int itemCount, required Widget Function(int index) itemBuilder, ScrollController? scrollController}) {
    _itemCount = itemCount;
    _itemBuilder = itemBuilder;
    _scrollController = scrollController;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      controller: _scrollController,
      child: Column(//set widgets vertically
        mainAxisSize: MainAxisSize.min,
        children: [for (int index = 0; index < _itemCount; index++) _itemBuilder(index)],
      ),
    );
  }
}
