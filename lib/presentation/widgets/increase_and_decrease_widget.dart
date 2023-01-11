import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';

import '../resources/assets_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'package:yallabaity/gobaity_app.dart';

class IncrementAndDecrementWidget extends StatefulWidget {
 final Function(int value)? onIncrementAndDecrementChange;

  const IncrementAndDecrementWidget({ this.onIncrementAndDecrementChange, super.key}) ;
  @override
  State<IncrementAndDecrementWidget> createState() => _IncrementAndDecrementWidgetState();
}

class _IncrementAndDecrementWidgetState extends State<IncrementAndDecrementWidget> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Row(// set widgets horizontally
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              counter > 1 ? --counter : 1;
            });
            widget.onIncrementAndDecrementChange!(counter);
          },
          child: Container(
            height: AppWidth.s37 * Constants.width,
            width: AppWidth.s37 * Constants.width,
            decoration: BoxDecoration(color: ColorsManager.chineseSilver, borderRadius: BorderRadius.circular(9)),
            child: SvgPicture.asset(
              AssetsManager.decrease,
              fit: BoxFit.none,
            ),
          ),
        ),
        SizedBox(
          width: AppWidth.s50*Constants.width,
          child: AutoSizeText(
            counter.toString(),
            style: getMediumStyle(fontSize:21),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              counter++;
            });
            widget.onIncrementAndDecrementChange!(counter);

          },
          child: Container(
            height: AppWidth.s37 * Constants.width,
            width: AppWidth.s37 * Constants.width,
            decoration:
                BoxDecoration(color: ColorsManager.maximumPurple.withOpacity(0.4), borderRadius: BorderRadius.circular(9)),
            child: SvgPicture.asset(
              AssetsManager.add,
              color: ColorsManager.maximumPurple,
              fit: BoxFit.none,
            ),
          ),
        ),
      ],
    );
  }
}
