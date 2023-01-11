part of 'sizes_bloc.dart';

@immutable
abstract class SizesEvent {}
class GetSizesEvent extends SizesEvent {}
class RefreshEvent extends SizesEvent{}
