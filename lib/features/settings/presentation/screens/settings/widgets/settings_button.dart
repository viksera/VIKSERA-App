import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/common_widgets/common_progress_indicator.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/core/widget_helper/widget_helper.dart';

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
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: WidgetHelper.cardDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon,
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
              const Icon(Icons.keyboard_arrow_right,
                  color: AppColors.appDarkGreenColor)
          ],
        ),
      ),
    );
  }
}
