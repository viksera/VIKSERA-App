import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';

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
    );
  }
}
