import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:yallabaity/network_layer/models/data_models/size_model.dart';
import 'package:yallabaity/network_layer/models/item_model.dart';

part 'food_sizes_state.dart';

class FoodSizesMangerCubit extends Cubit<FoodSizesManagerState> {

  List<SizeModel> foodSizesList=[];
  FoodSizesMangerCubit()
      : super(FoodSizesListViewChange(foodSizeList: const []));
  add(SizeModel foodSize) {
    foodSizesList.add(foodSize);
    emit(FoodSizesListViewChange(foodSizeList: foodSizesList));
  }

  remove() {
    foodSizesList.removeLast();
    emit(FoodSizesListViewChange(foodSizeList: foodSizesList));
  }
  set(SizeModel foodSize,int index) {
    foodSizesList[index]=foodSize;
    emit(FoodSizesListViewChange(foodSizeList: foodSizesList));
  }

  static addEvent(
          {required BuildContext context,required SizeModel foodSize}) =>
      BlocProvider.of<FoodSizesMangerCubit>(context).add(foodSize);
  static removeEvent({required BuildContext context}) =>
      BlocProvider.of<FoodSizesMangerCubit>(context).remove();
  static getList({required BuildContext context}) =>
      BlocProvider.of<FoodSizesMangerCubit>(context).state.foodSizeList;
  static changeFoodSize({required BuildContext context,required SizeModel foodSize,required int index}) =>
      BlocProvider.of<FoodSizesMangerCubit>(context).set(foodSize, index);
}
