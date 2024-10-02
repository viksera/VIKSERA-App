import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/common_widgets/custom_slider.dart';
import 'package:viksera/core/extensions/app_extensions.dart';

class OpportunityCard extends StatelessWidget {
  const OpportunityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
          color: AppColors.appBackgroundColor,
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Opportunity',
                  style:
                      AppStyles.style14.copyWith(fontWeight: FontWeight.w600)),
              GestureDetector(
                onTap: () {
                  // TODO: Need to implement redirection function
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'View more',
                      style: AppStyles.style10.copyWith(
                          fontWeight: FontWeight.w300,
                          color: AppColors.appPrimaryColor),
                    ),
                    2.widthBox,
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 14.sp,
                      color: AppColors.appPrimaryColor,
                    )
                  ],
                ),
              ),
            ],
          ),
          8.heightBox,
          Text(
            'New', // TODO : Placeholder text
            style: AppStyles.style12.copyWith(color: AppColors.pureGrey),
          ),
          3.heightBox,
          const CustomSlider(
            maxValue: 100, // TODO : Placeholder text
            minValue: 0, // TODO : Placeholder text
            activeTrackColor: AppColors.appRedColor,
            currentValue: 10, // TODO : Placeholder text
            isAnimated: true,
          ),
          8.heightBox,
          Text(
            'Open', // TODO : Placeholder text
            style: AppStyles.style12.copyWith(color: AppColors.pureGrey),
          ),
          3.heightBox,
          const CustomSlider(
            maxValue: 100, // TODO : Placeholder text
            minValue: 0, // TODO : Placeholder text
            activeTrackColor: AppColors.appRedColor,
            currentValue: 75, // TODO : Placeholder text
            isAnimated: true,
          ),
          8.heightBox,
          Text(
            'Won', // TODO : Placeholder text
            style: AppStyles.style12.copyWith(color: AppColors.pureGrey),
          ),
          3.heightBox,
          const CustomSlider(
            maxValue: 100, // TODO : Placeholder text
            minValue: 0, // TODO : Placeholder text
            activeTrackColor: AppColors.appRedColor,
            currentValue: 56, // TODO : Placeholder text
            isAnimated: true,
          ),
        ],
      ),
    );
  }
}
