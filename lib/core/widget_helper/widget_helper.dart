import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/core/extensions/app_extensions.dart';

class WidgetHelper {
  static Ink squareIcon({required IconData icon}) => Ink(
        decoration: cardDecoration(),
        height: 48,
        width: 48,
        child: Icon(
          icon,
          color: AppColors.appDarkGreenColor,
        ).wrapCenter(),
      );
  static BoxDecoration cardDecoration() => BoxDecoration(
          color: AppColors.appBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
                color: AppColors.pureBlack.withOpacity(0.25))
          ]);
}
