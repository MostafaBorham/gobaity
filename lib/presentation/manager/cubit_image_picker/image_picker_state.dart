part of 'image_picker_cubit.dart';

@immutable
abstract class ImagePickerState {

}

class ImagePickerInitial extends ImagePickerState {}

class LoadedListOfImagesState extends ImagePickerState {
  final List<String> pickedImages;
  LoadedListOfImagesState({required this.pickedImages}) ;
}
class LoadingListOImagesState extends ImagePickerState{}
class EmptyListOfImagesState extends ImagePickerState{}