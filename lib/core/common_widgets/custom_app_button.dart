import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/extensions/app_extensions.dart';

class CustomAppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color backgroundColor;
  final double width;
  final double height;
  final double borderRadius;
  final TextStyle? textStyle;
  const CustomAppButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.backgroundColor = AppColors.appPrimaryColor,
      this.width = double.infinity,
      this.height = 45,
      this.textStyle,
      this.borderRadius = 10});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width.w,
        height: height.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        child: Text(
          text,
          style: textStyle ??
              AppStyles.style14.copyWith(color: AppColors.pureWhite),
        ).wrapCenter(),
      ),
    );
  }
}
