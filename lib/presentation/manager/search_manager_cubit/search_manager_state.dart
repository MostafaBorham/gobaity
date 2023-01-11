part of 'search_manager_cubit.dart';

@immutable
abstract class SearchManagerState {}

class SearchManagerInitial extends SearchManagerState {}
class SearchWordState extends SearchManagerState{
  final String word;
  SearchWordState({required this.word});
}
class SearchIsEmptyState extends SearchManagerState{}