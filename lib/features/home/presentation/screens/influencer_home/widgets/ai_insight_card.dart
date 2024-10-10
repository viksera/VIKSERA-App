import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/constants/app_assets.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/extensions/app_extensions.dart';

class AiInsightCard extends StatelessWidget {
  const AiInsightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.appBackgroundColor,
          borderRadius: BorderRadius.circular(10.r),
          border:
              Border.all(color: AppColors.appDarkGreenColor.withOpacity(0.4))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.string(AppAssets.brain),
                  10.widthBox,
                  Text(
                    'AI Insights',
                    style: AppStyles.style18.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.pureBlack),
                  )
                ],
              ),
              const Icon(
                Icons.help_outlined,
                color: AppColors.appRedColor,
              )
            ],
          ),
          15.heightBox,
          Text(
            ' Consistently engage with your followers by replying to comments, hosting Q&A sessions, and encouraging user-generated content. Authentic engagement boosts visibility and trust, which appeals to potential clients.', // TODO : Placeholder text
            style: AppStyles.style16.copyWith(color: AppColors.appDarkGreyBlue),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
