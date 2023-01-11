part of 'carousel_images_slider_cubit.dart';

@immutable
abstract class CarouselImagesSliderState {
  final int currentIndex;

  const CarouselImagesSliderState({
    required this.currentIndex,
  });
}

class CarouselSliderInitial extends CarouselImagesSliderState {
  const CarouselSliderInitial({required super.currentIndex});
}

class ChangeIndexState extends CarouselImagesSliderState {
  const ChangeIndexState({required super.currentIndex});
}
