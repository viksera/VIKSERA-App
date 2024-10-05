import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/core/common_widgets/common_progress_indicator.dart';
import 'package:viksera/core/extensions/app_extensions.dart';

import '../../../../../../core/widget_helper/widget_helper.dart';
import '../../../../domain/entities/business_profile.dart';

//!BusinessProfileCard is to represent an individual influencer or marketing agency profile

class BusinessProfileCard extends StatelessWidget {
  final BusinessProfile profile;

  const BusinessProfileCard({Key? key, required this.profile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: WidgetHelper.cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: profile.imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                4.heightBox,
                if (profile.type == 'Influencer')
                  Row(
                    children: [
                      Icon(Icons.remove_red_eye, size: 16.sp),
                      4.widthBox,
                      Text('${profile.views} views'),
                    ],
                  ),
                4.heightBox,
                if (profile.type == 'Influencer')
                  Row(
                    children: [
                      Icon(Icons.camera_alt, size: 16.sp),
                      4.widthBox,
                      Text('@${profile.description}'),
                    ],
                  ),
                if (profile.type == 'Marketing Agency')
                  Row(
                    children: [
                      Icon(Icons.star, size: 16.sp, color: AppColors.pureBlack),
                      4.widthBox,
                      const Text('Rating: 4.5 stars'),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
