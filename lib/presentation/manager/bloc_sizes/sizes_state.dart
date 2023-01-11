part of 'sizes_bloc.dart';

@immutable
abstract class SizesState {}

class SizesInitial extends SizesState {}

class LoadingSizesState extends SizesState {}

class LoadedSizesState extends SizesState  {
  final List<SizeModel> sizes;
  LoadedSizesState({
    required this.sizes,
  });
}
class ErrorState extends SizesState{
  final String message;
  ErrorState({
    required this.message,
  });
}