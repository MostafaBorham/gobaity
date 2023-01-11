import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';
part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInitial());
  List<String> images = [];
  getList() async {
    List<XFile>? xFiles = await ImagePicker.platform.getMultiImage();
    if (xFiles != null && xFiles.isNotEmpty) {
      xFiles.forEach((element) {
        images.add(element.path);
      });
      emit(LoadedListOfImagesState(pickedImages: images));
    }
  }

  deleteImageFromList(int index) async {
    images.removeAt(index);
    if(images.isEmpty) {
      emit(EmptyListOfImagesState());
    } else {
      emit(LoadedListOfImagesState(pickedImages: images));
    }
  }
  String getImage(int index) {
    return images[index];
  }
  static getListOfImagesEvent(BuildContext context) =>
      BlocProvider.of<ImagePickerCubit>(context). getList();
  static String getImageFile(BuildContext context,int index) =>
      BlocProvider.of<ImagePickerCubit>(context).getImage(index);
  static deleteImageFromListEvent(BuildContext context,int index) =>
      BlocProvider.of<ImagePickerCubit>(context).deleteImageFromList(index);
  
}
