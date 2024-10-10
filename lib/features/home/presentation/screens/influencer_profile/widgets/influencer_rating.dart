import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/features/home/domain/entities/influencer_profile.dart';

class Ratings extends StatelessWidget {
  final InfluencerProfile profile;

  const Ratings({Key? key, required this.profile}) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      profile.rating.toString(),
                      style: AppStyles.style34
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    5.widthBox,
                    const Icon(Icons.star,
                        color: AppColors.appYellowColor, size: 36),
                  ],
                ),
                5.heightBox,
                Text(
                  '10 premium clients',
                  style: AppStyles.style18.copyWith(color: AppColors.pureGrey),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Happy', style: AppStyles.style18),
                    5.heightBox,
                    const SizedBox(
                      width: 150,
                      child: LinearProgressIndicator(
                        value: 0.2,
                        color: AppColors.appGreenColor,
                        backgroundColor: AppColors.appLightGreyColor,
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
                10.heightBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sad', style: AppStyles.style18),
                    5.heightBox,
                    const SizedBox(
                      width: 150,
                      child: LinearProgressIndicator(
                        value: 0.2,
                        color: AppColors.appRedColor,
                        backgroundColor: AppColors.appLightGreyColor,
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
              ],
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
