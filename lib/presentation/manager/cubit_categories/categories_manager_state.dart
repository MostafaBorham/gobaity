part of 'categories_manager_cubit.dart';

@immutable
abstract class CategoriesManagerState {}

class CategoriesManagerInitial extends CategoriesManagerState {}
class CategoriesLoadingState extends CategoriesManagerState {}

class CategoriesLoadedState extends CategoriesManagerState {
  final List<CategoryModel> categories;
  CategoriesLoadedState({
    required this.categories,
  });
}
class CategoriesErrorState extends CategoriesManagerState{
  final String message;
  CategoriesErrorState({
    required this.message,
  });
}