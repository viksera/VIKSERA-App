import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/core/widget_helper/widget_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsButton extends StatelessWidget {
  final bool isLogout;
  final VoidCallback onTap;
  final IconData icon;
  final String text;
  const SettingsButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
        decoration: WidgetHelper.cardDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon,
                    size: 18.sp,
                    color: isLogout
                        ? AppColors.pureRed
                        : AppColors.appDarkGreenColor),
                23.widthBox,
                Text(
                  text,
                  style: AppStyles.style18.copyWith(
                      fontWeight: FontWeight.w500,
                      color: isLogout
                          ? AppColors.pureRed
                          : AppColors.appDarkGreenColor),
                )
              ],
            ),
            if (!isLogout)
              Icon(Icons.keyboard_arrow_right,
                  size: 18.sp, color: AppColors.appDarkGreenColor)
          ],
        ),
      ),
    );
  }
}
