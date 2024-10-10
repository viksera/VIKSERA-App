import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viksera/core/extensions/app_extensions.dart';

import '../../../../../../config/typography/app_styles.dart';

class InfluencerPostsWidget extends StatelessWidget {
  final List<String> posts;

  InfluencerPostsWidget({required this.posts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Posts',
            style: AppStyles.style18.copyWith(fontWeight: FontWeight.bold)),
        10.heightBox,
        SizedBox(
          height: posts.isEmpty ? 0 : 250.h,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                  imageUrl: posts[index], fit: BoxFit.cover);
            },
          ),
        ),
      ],
    );
  }
}
