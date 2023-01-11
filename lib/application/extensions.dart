import 'dart:convert';

import 'package:yallabaity/application/app_constants/app_constants.dart';



extension CutomMethodsOnNullString on String? {
  String get orEmpty {
    if (this == null) {
      return AppConstants.empty;
    }
    return this!;
  }

  bool get isNullOrEmpty => (this == null || this!.isEmpty);
}
extension CutomMethodsOnNullDouble on double? {
  double get orZero {
    if (this == null) {
      return AppConstants.zero.toDouble();
    }
    return this!;
  }

}
extension CutomMethodsOnNullBool on bool? {
  bool get orFalse {
    if (this == null) {
      return false;
    }
    return this!;
  }

}

extension NonNullInteger on int? {
  int get orZero {
    if (this == null) {
      return AppConstants.zero;
    }
    return this!;
  }
}


extension CutomMethodsOnDouble on double {
  String removeDecimalZeroFormat() {
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    return toString().replaceAll(regex, '');
  }
}

extension CutomMethodsOnObject on Object {
  String get fromJsonToString => jsonEncode(this);
}

extension CutomMethodsOnNullObject on Object? {
  String get fromJsonToString => jsonEncode(this);
  bool get isNull => this == null;
}

extension CutomMethodsOnMap on Map<String,dynamic> {
  String get fromJsonToString => jsonEncode(this);
}

extension CutomMethodsOnString on String {
  dynamic get fromStringToJson => jsonDecode(this);
  bool isEqualIgnoreCase(String str) => toLowerCase() == str.toLowerCase() ? true : false;
}
extension NullableList on List?{
  List get orList=> this ?? [];
}