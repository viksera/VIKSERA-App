import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/typography/app_styles.dart';

class AppThemes {
  static ThemeData buildThemeData() {
    final ThemeData base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
        primaryColor: AppColors.appPrimaryColor,
        scaffoldBackgroundColor: AppColors.pureWhite,
        textTheme: base.textTheme.apply(
          fontFamily: 'Quicksand',
          displayColor: AppColors.pureBlack,
          bodyColor: AppColors.pureBlack,
        ),
        inputDecorationTheme: inputDecorationTheme());
  }

  static InputDecorationTheme inputDecorationTheme() => InputDecorationTheme(
      fillColor: AppColors.appBackgroundColor,
      filled: true,
      hintStyle: AppStyles.style14.copyWith(
          fontWeight: FontWeight.w600, color: AppColors.appDarkGreenColor),
      border: InputBorder.none,
      iconColor: AppColors.appDarkGreenColor,
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.pureRed)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none));
}
