import 'package:flutter/cupertino.dart';

class HorizontalListView extends StatelessWidget {
  late int _itemCount;
  late Widget Function(int index) _itemBuilder;
  ScrollController? _scrollController;
  HorizontalListView({super.key,
    required int itemCount,
    required Widget Function(int index) itemBuilder,
    ScrollController? scrollController
  }) {
    _itemCount = itemCount;
    _itemBuilder = itemBuilder;
    _scrollController=scrollController;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics:BouncingScrollPhysics(),
      controller: _scrollController,
      child: Row(// set widgets horizontally

        children: [
          for (int index = 0; index < _itemCount; index++) _itemBuilder(index)
        ],
      ),
    );
  }
}
