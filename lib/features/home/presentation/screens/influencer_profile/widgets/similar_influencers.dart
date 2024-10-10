import 'package:flutter/material.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/config/typography/app_styles.dart';

import '../../../../domain/entities/influencer_profile.dart';

class SimilarInfluencersWidget extends StatelessWidget {
  final List<InfluencerProfile> similarInfluencers;

  const SimilarInfluencersWidget({Key? key, required this.similarInfluencers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return similarInfluencers.isEmpty
        ? Text('No similar influencers found.')
        : SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: similarInfluencers.length,
              itemBuilder: (context, index) {
                final influencer = similarInfluencers[index];
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(influencer.profileImage),
                    ),
                    10.heightBox,
                    Text(
                      influencer.name,
                      style: AppStyles.style14,
                    ),
                  ],
                ).pSymmetric(horizontal: 10);
              },
            ),
          );
  }
}
