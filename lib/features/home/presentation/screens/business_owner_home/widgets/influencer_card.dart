import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/extensions/app_extensions.dart';

class InfluencerCard extends StatelessWidget {
  const InfluencerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: AppColors.appBackgroundColor,
      elevation: 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: AppColors.appDarkGreenColor, width: 1)),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            height: 166,
            width: 121,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
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
          ).width(80).positioned(bottom: 20, left: 11)
        ],
      ),
    );
  }
}
