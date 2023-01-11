part of 'food_sizes_cubit.dart';

@immutable
abstract class FoodSizesManagerState {
  final List<SizeModel> foodSizeList;
  const FoodSizesManagerState({
    required this.foodSizeList,
  });
}

class FoodSizesListViewChange extends FoodSizesManagerState {
  FoodSizesListViewChange({required super.foodSizeList});
}

