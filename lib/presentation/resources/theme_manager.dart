import 'package:flutter/material.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/fonts_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';

ThemeData getTheme() => ThemeData(
    /************************* main colors ********************************************/
    primaryColor: ColorsManager.platinum,
    splashColor: ColorsManager.transparent,
    scaffoldBackgroundColor: ColorsManager.white,

    /* for button ripple effect*/
    /************************** bottomsheet ******************************************/
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorsManager.white,
      elevation: 0,
      modalElevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppWidth.s36*Constants.width),
              topRight: Radius.circular(AppWidth.s36*Constants.width))),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
      )
    ),


    /*   */ /*************************** cardview theme *************************************/ /*
    cardTheme: CardTheme(
        clipBehavior: Clip.antiAliasWithSaveLayer,// is used to clip the internal child widget of container when u define border radius,
        color: ColorsManager.white,
        shadowColor: ColorsManager.darkGrey,
        elevation: AppSize.s4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s10))),
    */ /******************************** elevated button theme *************************/ /*
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s17),
          ),
          primary: ColorsManager.primary,
          shadowColor: ColorsManager.lightPrimary,
          elevation: AppSize.s4,
          textStyle: getRegularStyle(
              color: ColorsManager.white, fontSize: FontSizeManager.f17)),
    ),
    */ /********************************** text button theme ******************************/ /*
    textButtonTheme: TextButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorsManager.primary, fontSize: FontSizeManager.f12))),
  */ /*  */ /**/ /*********************************** text theme************************************/ /**/ /*
    textTheme: TextTheme(
      headlineLarge: getSemiBoldStyle(
          color: ColorsManager.darkGrey, fontSize: FontSizeManager.f16),
      headlineSmall: getRegularStyle(
          color: ColorsManager.darkGrey, fontSize: FontSizeManager.f14),
      titleLarge: getSemiBoldStyle(
          color: ColorsManager.primary, fontSize: FontSizeManager.f18),
      titleSmall: getBoldStyle(
          color: ColorsManager.primary, fontSize: FontSizeManager.f12),
      bodyLarge: getRegularStyle(color: ColorsManager.grey1),
      bodySmall: getRegularStyle(color: ColorsManager.grey),
      titleMedium: getMediumStyle(
          color: ColorsManager.primary, fontSize: FontSizeManager.f16),
    ),

    */ /**/ /********************************* input decoration theme ****************************/ /**/ /*
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
          color: ColorsManager.grey2, fontSize: FontSizeManager.f14),
      labelStyle: getRegularStyle(
          color: ColorsManager.grey2, fontSize: FontSizeManager.f14),
      errorStyle: getRegularStyle(color: ColorsManager.red),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s10),
          borderSide: BorderSide(width: AppSize.s1, color: ColorsManager.grey)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
          borderSide:
              BorderSide(width: AppSize.s1_5, color: ColorsManager.grey)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
          borderSide:
              BorderSide(width: AppSize.s1_5, color: ColorsManager.grey)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
          borderSide:
              BorderSide(width: AppSize.s1_5, color: ColorsManager.primary)),*/ /*
    )*/
    );
