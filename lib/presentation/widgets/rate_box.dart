import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallabaity/application/extensions.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';

class RateBox extends StatelessWidget {
  late double _rate;
  late int _nReted;
  Color? _backgroundColor;
  RateBox(
      {super.key, required double rate,
      required int nReted,
      Color? backgroundColor = ColorsManager.white}) {
    _rate = rate;
    _nReted = nReted;
    _backgroundColor = backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppWidth.s9 * Constants.width,
        vertical: AppHeight.s6*Constants.height,
      ),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Row(// set widgets horizontally
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: AppWidth.s9 * Constants.width,
            width: AppWidth.s9 * Constants.width,
            child: SvgPicture.asset(
              AssetsManager.review,
            ),
          ),
          SizedBox(
            width: AppWidth.s4 * Constants.width,
          ),
          Text(
            _rate.removeDecimalZeroFormat(),
            style: getBoldStyle(
                color: ColorsManager.black,
                fontSize: AppWidth.s12 * Constants.width),
          ),
          SizedBox(
            width: AppWidth.s3* Constants.width,
          ),
          Text(
            '(+$_nReted)',
            style: getBoldStyle(
                color: ColorsManager.graniteGray,
                fontSize: AppWidth.s9 * Constants.width),
          ),

        ],
      ),
    );
  }
}
