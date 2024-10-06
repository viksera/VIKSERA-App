import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import '../../../../../../config/typography/app_styles.dart';
import '../../../../domain/entities/influencer_profile.dart';

class Ratings extends StatelessWidget {
  final InfluencerProfile profile;

  const Ratings({Key? key, required this.profile}) : super(key: key);

  String formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ratings',
          style: AppStyles.style18.copyWith(fontWeight: FontWeight.bold),
        ),
        15.heightBox,
        Row(
          children: [
            Text(
              profile.rating.toString(),
              style: AppStyles.style34,
            ),
            5.widthBox,
            const Icon(Icons.star, color: AppColors.appYellowColor, size: 36),
            10.widthBox,
            Text(
              '10 premium clients',
              style: AppStyles.style18.copyWith(color: AppColors.pureGrey),
            ),
          ],
        ),
        20.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Happy', style: AppStyles.style18),
            10.widthBox,
            const Expanded(
              child: LinearProgressIndicator(
                value: 0.8,
                color: AppColors.appGreenColor,
                backgroundColor: AppColors.appLightGreyColor,
                minHeight: 8,
              ),
            ),
          ],
        ),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sad', style: AppStyles.style18),
            10.widthBox,
            const Expanded(
              child: LinearProgressIndicator(
                value: 0.2,
                color: AppColors.appRedColor,
                backgroundColor: AppColors.appLightGreyColor,
                minHeight: 8,
              ),
            ),
          ],
        ),
        20.heightBox,
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'View Experiences',
              style: AppStyles.style18.copyWith(color: Colors.purple),
            ),
          ),
        ),
      ],
    );
  }
}
