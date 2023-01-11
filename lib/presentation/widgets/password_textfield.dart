import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/fonts_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/error_widget.dart';

class PasswordTextField extends StatefulWidget {
  final String? Function(String? text)? validator;
  final void Function(String text)? onChanged;
  final void Function(String? text)? onSaved;
  final String? text;
  final String? message;
  final bool? showError;
  final AlignmentGeometry? alignment;

  const PasswordTextField(
      {super.key,
      this.text,
      this.validator,
      this.onChanged,
      this.onSaved,
      this.showError,
      this.message,
      this.alignment=Alignment.topLeft});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool showPassword = false;
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(//set widgets vertically
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.whiteGrey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            keyboardType: TextInputType.number,
            obscureText: obscureText,

            decoration: InputDecoration(
                hintText: widget.text,
                hintStyle: getMediumStyle(
                  color: ColorsManager.graniteGray2,
                  fontSize: AppWidth.s14 * Constants.width,
                ),

                contentPadding: EdgeInsets.symmetric(vertical: AppHeight.s17*Constants.height),
                border: InputBorder.none,
                prefix: SizedBox(
                  width: AppWidth.s45 * Constants.width,
                ),
                suffixIconConstraints: BoxConstraints(
                  minHeight: AppWidth.s20 * Constants.width,
                  minWidth: AppWidth.s20 * Constants.width,
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppWidth.s21 * Constants.width,
                  ),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        showPassword = !showPassword;
                        obscureText = !obscureText;
                      });
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: showPassword
                          ? SvgPicture.asset(
                              AssetsManager.visibilityOn,
                              color: ColorsManager.black,
                              height: AppWidth.s20 * Constants.width,
                              width: AppWidth.s20 * Constants.width,
                            )
                          : SvgPicture.asset(
                              AssetsManager.visibilityOff,
                              color: ColorsManager.black,
                              height: AppWidth.s20 * Constants.width,
                              width: AppWidth.s20 * Constants.width,
                            ),
                    ),
                  ),
                )),
            validator: widget.validator,
            onChanged: widget.onChanged,
            onSaved: widget.onSaved,
          ),
        ),
        CustomErrorWidget(
            alignment: widget.alignment,
            visible: widget.showError!,
            message: widget.message)
      ],
    );
  }
}
