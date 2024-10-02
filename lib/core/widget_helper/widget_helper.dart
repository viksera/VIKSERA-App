import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/core/extensions/app_extensions.dart';

class WidgetHelper {
  static InkWell squareIconButton(
          {required IconData icon, required VoidCallback onTap}) =>
      InkWell(
        borderRadius: BorderRadius.circular(10.r),
        onTap: onTap,
        child: Ink(
          decoration: cardDecoration(),
          height: 48.w,
          width: 48.w,
          child: Icon(
            icon,
            color: AppColors.appDarkGreenColor,
          ).wrapCenter(),
        ),
      );
  static BoxDecoration cardDecoration() => BoxDecoration(
          color: AppColors.appBackgroundColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
                color: AppColors.pureBlack.withOpacity(0.25))
          ]);
}
