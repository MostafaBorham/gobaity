import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/shimmer_widget.dart';

class TagsWidget extends StatelessWidget {
  final List<String>? tags;
  final bool? isLoaded;
  const TagsWidget({super.key, this.tags, this.isLoaded = false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return isLoaded!
        ? Wrap(
            spacing: AppWidth.s9 * Constants.width,
            runSpacing: AppWidth.s9 * Constants.width,
            children: [
              for (int index = 0; index < tags!.length; index++)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppWidth.s8 * Constants.width,
                    vertical: AppHeight.s3 * Constants.height,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsManager.whiteGrey,
                    borderRadius: BorderRadius.circular(AppWidth.s4 * Constants.width),
                  ),
                  child: Text(
                    tags![index],
                    style: getMediumStyle(
                      fontSize: AppWidth.s12 * Constants.width,
                      color: ColorsManager.graniteGray,
                    ),
                  ),
                )
            ],
          )
        : SizedBox(
            height: AppHeight.s15 * Constants.height,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => ShimmerWidget(
                height: AppHeight.s15 * Constants.height,
                width: AppWidth.s30 * Constants.width,
                borderRadius: BorderRadius.circular(AppWidth.s4 * Constants.width),
              ),
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                width: AppWidth.s9 * Constants.width,
              ),
            ),
          );
  }
}
