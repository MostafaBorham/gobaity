part of 'categories_bloc.dart';

@immutable
abstract class CategoriesEvent {}

class GetCategoriesEvent extends CategoriesEvent {}
class GetUserCategoriesEvent extends CategoriesEvent {
  final int userId;

  GetUserCategoriesEvent({required this.userId});
}
class RefreshEvent extends CategoriesEvent{}