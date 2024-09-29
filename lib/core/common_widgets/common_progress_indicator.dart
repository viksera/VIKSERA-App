import 'package:flutter/material.dart';
import 'package:viksera/core/extensions/app_extensions.dart';

import '../../config/colors/app_colors.dart';

class CommonCircularProgressIndicator extends StatelessWidget {
  final Color color;
  final double radius;

  const CommonCircularProgressIndicator({
    super.key,
    this.progress,
    this.color = AppColors.appPrimaryColor,
    this.radius = 90,
  });

  final double? progress;

  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(
                strokeWidth: 1.5, value: progress, color: color)
            .widthHeight(radius / 2, radius / 2),
      );
}
