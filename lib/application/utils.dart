import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

class Utils {
  Utils._internal();
  static Size getTextSize(String text, TextStyle style, BuildContext context) {
    return (TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textDirection: TextDirection.ltr,
    )..layout())
        .size;
  }

  static getFileNameFromPath(String path) => path.split('/').last;
  static getFileNameFromFile(File file) => file.path.split('/').last;
  static hideKeyboard() => FocusManager.instance.primaryFocus!.unfocus();

}
