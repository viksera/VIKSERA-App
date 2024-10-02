import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfluencerCard extends StatelessWidget {
  const InfluencerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: AppColors.appBackgroundColor,
      elevation: 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side: BorderSide(color: AppColors.appDarkGreenColor, width: 1.w)),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            height: 166.w,
            width: 121.w,
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      'https://images.pexels.com/photos/3296547/pexels-photo-3296547.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'), // TODO: Dummy data
            ),
          ),
          Text(
            'Cotton bro studio', // TODO: Dummy data
            style: AppStyles.style14.copyWith(
                color: AppColors.pureWhite, fontWeight: FontWeight.w700),
          ).width(60.w).positioned(bottom: 20.w, left: 11.w)
        ],
      ),
    );
  }
}
