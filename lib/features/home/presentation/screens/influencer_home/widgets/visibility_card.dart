import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/common_widgets/custom_slider.dart';
import 'package:viksera/core/extensions/app_extensions.dart';

class VisibilityCard extends StatelessWidget {
  const VisibilityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      height: 187,
      decoration: BoxDecoration(
          color: AppColors.appBackgroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Visibility',
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
                    const Icon(
                      Icons.arrow_forward_rounded,
                      size: 14,
                      color: AppColors.appPrimaryColor,
                    )
                  ],
                ),
              ),
            ],
          ),
          8.heightBox,
          Text(
            'Impressions', // TODO : Placeholder text
            style: AppStyles.style12.copyWith(color: AppColors.pureGrey),
          ),
          3.heightBox,
          const CustomSlider(
            maxValue: 100, // TODO : Placeholder text
            minValue: 0, // TODO : Placeholder text
            activeTrackColor: AppColors.appGreenColor,
            currentValue: 50, // TODO : Placeholder text
            isAnimated: true,
          ),
          8.heightBox,
          Text(
            'Clicks', // TODO : Placeholder text
            style: AppStyles.style12.copyWith(color: AppColors.pureGrey),
          ),
          3.heightBox,
          const CustomSlider(
            maxValue: 100, // TODO : Placeholder text
            minValue: 0, // TODO : Placeholder text
            activeTrackColor: AppColors.appGreenColor,
            currentValue: 25, // TODO : Placeholder text
            isAnimated: true,
          ),
          8.heightBox,
          Text(
            'Conversions (last 30 days)', // TODO : Placeholder text
            style: AppStyles.style12.copyWith(color: AppColors.pureGrey),
          ),
          3.heightBox,
          const CustomSlider(
            maxValue: 100, // TODO : Placeholder text
            minValue: 0, // TODO : Placeholder text
            activeTrackColor: AppColors.appGreenColor,
            currentValue: 100, // TODO : Placeholder text
            isAnimated: true,
          ),
        ],
      ),
    );
  }
}
