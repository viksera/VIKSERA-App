import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import '../../../../../../config/colors/app_colors.dart';
import '../../../../../../config/typography/app_styles.dart';
import '../../../../domain/entities/influencer_profile.dart';

class Ratings extends StatelessWidget {
  final InfluencerProfile profile;

  const Ratings({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ratings',
            style: AppStyles.style18.copyWith(fontWeight: FontWeight.bold)),
        15.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(profile.rating.toString(),
                        style: AppStyles.style34
                            .copyWith(fontWeight: FontWeight.bold)),
                    5.widthBox,
                    const Icon(Icons.star,
                        color: AppColors.appYellowColor, size: 36),
                  ],
                ),
                5.heightBox,
                Text('10 premium clients',
                    style:
                        AppStyles.style18.copyWith(color: AppColors.pureGrey)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProgressIndicator('Happy', 0.8, AppColors.appGreenColor),
                10.heightBox,
                _buildProgressIndicator('Sad', 0.2, AppColors.appRedColor),
              ],
            ),
          ],
        ),
        20.heightBox,
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text('View Experiences',
                style: AppStyles.style18.copyWith(color: Colors.purple)),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressIndicator(String label, double value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.style18),
        5.heightBox,
        SizedBox(
          width: 150.w,
          child: LinearProgressIndicator(
            value: value,
            color: color,
            backgroundColor: AppColors.appLightGreyColor,
            minHeight: 8.h,
          ),
        ),
      ],
    );
  }
}
