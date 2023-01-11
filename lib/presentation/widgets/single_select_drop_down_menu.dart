import 'package:flutter/material.dart';

import 'package:yallabaity/network_layer/models/item_model.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';

import 'custom_drop_tile.dart';

class SingleSelectDropDownMenu extends StatefulWidget {
  List<ItemModel>? list;
  Function(ItemModel value)? onSelectedItem;
  bool? isLoaded;
  int? activeItemIndex ;
  String? title;
  SingleSelectDropDownMenu({
    required this.list,
    this.title,
    this.isLoaded = false,
    this.onSelectedItem,
    this.activeItemIndex=0,
    super.key,
  });
  @override
  State<SingleSelectDropDownMenu> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<SingleSelectDropDownMenu> {
  int? _index;

  bool _expand = false;

  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _index=widget.activeItemIndex;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(//set widgets vertically
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropTile(
          text: widget.title!,
          onTap: (expand) {
            setState(() {
              _expand = expand;
            });
          },
          isLoaded: widget.isLoaded!,
        ),
        _buildDropDown(),
      ],
    );
  }

  _buildDropDown() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppWidth.s11 * Constants.width),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        switchInCurve: Curves.easeInOutSine,
        switchOutCurve: Curves.fastLinearToSlowEaseIn,
        child: _expand
            ? ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                    maxHeight: AppHeight.s150 * Constants.height),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorsManager.brightGray2,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  child: Scrollbar(
                    thickness: 3,
                    interactive: true,
                    trackVisibility: true,
                    thumbVisibility: true,
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppHeight.s20 * Constants.height,
                            horizontal: AppWidth.s28 * Constants.width),
                        child: Wrap(
                            spacing: AppWidth.s19 * Constants.width,
                            runSpacing: AppHeight.s8*Constants.height,
                            children: [
                              for (int index = 0;
                                  index < widget.list!.length;
                                  index++)
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    setState(() {
                                      widget.list![_index!].active = false;
                                      widget.list![index].active = true;
                                      widget.title = widget.list![index].title;
                                      _index = index;
                                      if (widget.onSelectedItem != null) {
                                        widget
                                            .onSelectedItem!(widget.list![index]);
                                      }
                                    });
                                  },
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: AppWidth.s95 * Constants.width,
                                    ),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: widget.list![index].active
                                            ? ColorsManager.maximumPurple
                                            : ColorsManager.brightGray2,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: ColorsManager.graniteGray,
                                            width: 1,
                                            style: BorderStyle.solid),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: AppHeight.s7*Constants.height,
                                        ),
                                        child: Text(
                                          widget.list![index].title,
                                          textAlign: TextAlign.center,
                                          style: getMediumStyle(
                                              fontSize: AppWidth.s14 *
                                                  Constants.width,
                                              color: widget.list![index].active
                                                  ? ColorsManager.white
                                                  : ColorsManager.graniteGray),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                            ]),
                      ),
                    ),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
