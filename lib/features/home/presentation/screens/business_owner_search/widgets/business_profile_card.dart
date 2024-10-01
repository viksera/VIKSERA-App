import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';

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
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                if (profile.type == 'Influencer')
                  Row(
                    children: [
                      const Icon(Icons.remove_red_eye, size: 16),
                      const SizedBox(width: 4),
                      Text('${profile.views} views'),
                    ],
                  ),
                const SizedBox(height: 4),
                if (profile.type == 'Influencer')
                  Row(
                    children: [
                      const Icon(Icons.camera_alt, size: 16),
                      const SizedBox(width: 4),
                      Text('@${profile.description}'),
                    ],
                  ),
                if (profile.type == 'Marketing Agency')
                  const Row(
                    children: [
                      Icon(Icons.star, size: 16, color: AppColors.pureBlack),
                      SizedBox(width: 4),
                      Text('Rating: 4.5 stars'),
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
