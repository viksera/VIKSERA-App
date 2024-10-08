import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import '../../../../../../config/colors/app_colors.dart';
import '../../../../../../config/typography/app_styles.dart';
import '../../../../../../core/widget_helper/widget_helper.dart';
import '../../../../domain/entities/influencer_profile.dart';

class ProfileHeader extends StatelessWidget {
  final InfluencerProfile profile;

  const ProfileHeader({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: CachedNetworkImageProvider(profile.profileImage),
          backgroundColor: Colors.transparent,
        ).pSymmetric(vertical: 10),
        Text(profile.name,
            style: AppStyles.style20.copyWith(fontWeight: FontWeight.bold)),
        Text(profile.bio, style: AppStyles.style16),
        30.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildProfileStat('Type', profile.type),
            _buildProfileStat('Popularity', _formatNumber(profile.popularity)),
            _buildProfileStat('Rating', '${profile.rating} ⭐'),
          ],
        ),
        30.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.appPrimaryColor,
                textStyle: AppStyles.style16,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              ),
              child:
                  const Text('Message', style: TextStyle(color: Colors.white)),
            ),
            20.widthBox,
            WidgetHelper.squareIconButton(
              icon: Icons.phone,
              onTap: () {},
            ),
            20.widthBox,
            WidgetHelper.squareIconButton(
              icon: Icons.share,
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }

  Widget _buildProfileStat(String label, String value) {
    return Column(
      children: [
        Text(label, style: AppStyles.style14),
        Text(value,
            style: AppStyles.style16.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
