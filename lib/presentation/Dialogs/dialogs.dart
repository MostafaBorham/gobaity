import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/widgets/custom_dialog.dart';
BuildContext? dialogContext;
void showCustomDialog(BuildContext context,{String? message}) => showDialog(
  context: context,
  barrierDismissible: false,
  builder: (context) {
    dialogContext = context;
    return CustomDialog(message: message,);
  },
);
dismissCustomDialog()=>Navigator.pop(dialogContext!);