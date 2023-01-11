import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/widgets/error_widget.dart';

import '../resources/constants_manager.dart';
import '../resources/values_manager.dart';

class CustomTextField extends StatelessWidget {

  String? Function(String? text)? validator;
  void Function(String text)? onChanged;
  void Function(String? text)? onSaved;
  bool? isNumber;
  int? maxLines;
  TextEditingController? controller;
  String? hintText;  String? message;
  bool? showError;
  AlignmentGeometry? alignment;
  CustomTextField(
      {super.key,
      this.hintText,
      this.maxLines,
      this.message,
      this.showError = false,
      this.alignment = Alignment.topLeft,
      this.validator,
      this.onChanged,
      this.isNumber = false,
      this.onSaved,
      this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(//set widgets vertically
       children: [
      Container(
        decoration: BoxDecoration(
          color: ColorsManager.whiteGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          cursorColor: ColorsManager.maximumPurple,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: getMediumStyle(
              color: ColorsManager.graniteGray2,
              fontSize: AppWidth.s14 * Constants.width,
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: AppWidth.s18 * Constants.width,
                horizontal: AppWidth.s45 * Constants.width),
            border: InputBorder.none,
          ),
          onSaved: onSaved,
          validator: validator,
          onChanged: onChanged,
          keyboardType: isNumber!
              ? TextInputType.numberWithOptions(decimal: false)
              : null,
        ),
      ),
      CustomErrorWidget(
          alignment: alignment, visible: showError!, message: message)
    ]);
  }
}
