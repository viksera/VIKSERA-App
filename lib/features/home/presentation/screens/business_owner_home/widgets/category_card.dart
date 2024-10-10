import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final Color color;
  const CategoryCard({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: 121.w,
      height: 100.w,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.r),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                  'https://tse4.mm.bing.net/th?id=OIP.kTvs-fiEdCw7rldk41rhKwHaEo&pid=Api&P=0&h=180'), // TODO: Dummy data
              opacity: 0.2)),
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: AppStyles.style16
            .copyWith(color: AppColors.pureBlack, fontWeight: FontWeight.w700),
      ).wrapCenter(),
    );
  }
}
