import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'carousel_images_slider_state.dart';

class CarouselImageSliderCubit extends Cubit<CarouselImagesSliderState> {
  CarouselImageSliderCubit() : super(const CarouselSliderInitial(currentIndex: 0));
  changeIndex(int index) => emit(ChangeIndexState(currentIndex: index));
  static swipeEvent(BuildContext context, int index) =>
      BlocProvider.of<CarouselImageSliderCubit>(context).changeIndex(index);
}
