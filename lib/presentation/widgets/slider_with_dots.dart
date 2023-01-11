import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yallabaity/application/app_api_constants/api_constants.dart';
import 'package:yallabaity/network_layer/models/data_models/ad_model.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/custom_network_image.dart';
import 'package:yallabaity/presentation/widgets/shimmer_widget.dart';

class SliderWithDots extends StatefulWidget {
  List<AdsModel>? ads;
  bool? isLoaded;
  SliderWithDots({this.ads, this.isLoaded = false, Key? key}) : super(key: key);

  @override
  State<SliderWithDots> createState() => _SliderWithDotsState();
}

class _SliderWithDotsState extends State<SliderWithDots> {
  int adSliderImage = 0;

  @override
  Widget build(BuildContext context) {
    return widget.isLoaded!
        ? Column(//set widgets vertically
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                  itemCount: widget.ads!.length,
                  itemBuilder: (context, index, realIndex) => Padding(
                        padding: EdgeInsets.only(
                            bottom: AppHeight.s24 * Constants.height,
                            left: AppWidth.s17 * Constants.width / 2,
                            right: AppWidth.s17 * Constants.width / 2),
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,// is used to clip the internal child widget of container when u define border radius,
                          width: double.maxFinite,
                          decoration: BoxDecoration(color: ColorsManager.platinum, borderRadius: BorderRadius.circular(10)),
                          child: CustomNetworkImage(
                            imageUrl:  ApiConstants.fullUrl+ widget.ads![index].adsImage!,

                          ),
                        ),
                      ),
                  options: CarouselOptions(
                      /* control image height */
                      height: AppHeight.s138 * Constants.height,
                      viewportFraction: 0.8,
                      autoPlay: false,
                      autoPlayAnimationDuration: const Duration(seconds:2 ),
                      pauseAutoPlayOnTouch: true,
                      scrollPhysics: const BouncingScrollPhysics(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,// is used to clip the internal child widget of container when u define border radius,
                      onPageChanged: (int page, _) {
                        setState(() {
                          adSliderImage = page;
                        });
                      })),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  height: AppWidth.s4 * Constants.width,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.ads!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => adSliderImage == index
                        ? Container(
                            width: MediaQuery.of(context).size.width * 0.06,
                            clipBehavior: Clip.antiAliasWithSaveLayer,// is used to clip the internal child widget of container when u define border radius,
                            decoration: BoxDecoration(color: ColorsManager.black, borderRadius: BorderRadius.circular(2)),
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width * 0.04,
                            clipBehavior: Clip.antiAliasWithSaveLayer,// is used to clip the internal child widget of container when u define border radius,
                            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
                            decoration: BoxDecoration(
                                color: ColorsManager.black.withOpacity(0.22), borderRadius: BorderRadius.circular(2)),
                          ),
                    separatorBuilder: (BuildContext context, int index) => SizedBox(
                      width: AppWidth.s5 * Constants.width,
                    ),
                  ),
                ),
              )
            ],
          )
        : _buildShimmer();
  }

  Widget _buildShimmer() => Column(//set widgets vertically
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
              itemCount: 2,
              itemBuilder: (context, index, realIndex) => Padding(
                    padding: EdgeInsets.only(
                        bottom: AppHeight.s24 * Constants.height,
                        left: AppWidth.s17 * Constants.width / 2,
                        right: AppWidth.s17 * Constants.width / 2),
                    child: ShimmerWidget(width: double.maxFinite, borderRadius: BorderRadius.circular(10)),
                  ),
              options: CarouselOptions(
                  /* control image height */
                  height: AppHeight.s138 * Constants.height,

                  /**/

                  viewportFraction: 0.8,
                  autoPlay: false,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  pauseAutoPlayOnTouch: true,
                  scrollPhysics: BouncingScrollPhysics(),
                  clipBehavior: Clip.antiAliasWithSaveLayer,// is used to clip the internal child widget of container when u define border radius,
                  onPageChanged: (int page, _) {
                    setState(() {
                      adSliderImage = page;
                    });
                  })),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: SizedBox(
              height: AppWidth.s4 * Constants.width,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (context, index) => adSliderImage == index
                    ? ShimmerWidget(width: MediaQuery.of(context).size.width * 0.06, borderRadius: BorderRadius.circular(2))
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
                        child: ShimmerWidget(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: AppWidth.s5 * Constants.width,
                ),
              ),
            ),
          )
        ],
      );
}
