import 'package:flutter/material.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/Color_Manager.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/Styles_Manager.dart';
import 'package:mvvm_clean_architicture/Presentation_layer/resources/Value_Manager.dart';

import 'Font_Manager.dart';

ThemeData GetApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,

    // CardView Theme:
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // AppBar Theme:
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle:
          getRegularStyle(fontsize: FontSize.s16, color: ColorManager.white),
    ),

    //Button Theme:
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.lightPrimary,
      buttonColor: ColorManager.primary,
    ),

    //Elevated Button Theme:
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
          fontsize: FontSize.s16,
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12)),
      ),
    ),

    // Text Theme :

    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
          color: ColorManager.darkGrey, fontsize: FontSize.s16),
      headlineLarge: getSemiBoldStyle(
          color: ColorManager.darkGrey, fontsize: FontSize.s16),
      headlineMedium:
          getRegularStyle(color: ColorManager.darkGrey, fontsize: FontSize.s14),
      titleMedium:
          getMediumStyle(color: ColorManager.primary, fontsize: FontSize.s16),
      titleSmall:
          getRegularStyle(color: ColorManager.white, fontsize: FontSize.s16),
      bodyLarge: getRegularStyle(color: ColorManager.grey1),
      bodySmall: getRegularStyle(color: ColorManager.grey),
      bodyMedium:
          getRegularStyle(color: ColorManager.grey2, fontsize: FontSize.s12),
      labelSmall:
          getBoldStyle(color: ColorManager.primary, fontsize: FontSize.s12),
    ),

    // Input Decoration Theme:

    inputDecorationTheme: InputDecorationTheme(
      // Content Padding..
      contentPadding: EdgeInsets.all(AppPading.p8),
      // Hint Style: ..
      hintStyle:
          getRegularStyle(color: ColorManager.grey, fontsize: FontSize.s14),
      // Error Style:..
      errorStyle:
          getRegularStyle(color: ColorManager.error, fontsize: FontSize.s14),
      // Label Style: ..
      labelStyle:
          getRegularStyle(color: ColorManager.grey, fontsize: FontSize.s14),
      //EnabledBorder: ..
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
      ),

      //Focused Border Style :..
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
      ),

      //Error Border Style: ..
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
      ),

      //Focused Error Border Style:..
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
      ),

      //Disabled Border:..
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
      ),
    ),
  );
}
