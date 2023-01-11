part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState {}

class SizesCategoriesInitial extends CategoriesState {}

class LoadingState extends CategoriesState {}

class LoadedState extends CategoriesState  {
  final List<CategoryEntity> categories;
  LoadedState({
    required this.categories,
  });
}
class ErrorState extends CategoriesState{
  final String message;
  ErrorState({
    required this.message,
  });
}