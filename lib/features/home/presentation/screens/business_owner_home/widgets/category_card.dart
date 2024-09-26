import 'package:flutter/material.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/common_widgets/common_progress_indicator.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/core/widget_helper/widget_helper.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  const CategoryCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(10),
            child: WidgetHelper.squareIcon(icon: Icons.fastfood_rounded)),
        5.heightBox,
        Text(
          title,
          style: AppStyles.style9.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
