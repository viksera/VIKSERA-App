import 'package:flutter/material.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/features/home/domain/entities/business_profile.dart';
import 'business_profile_card.dart';

class InfluencersGrid extends StatelessWidget {
  final List<BusinessProfile> businessProfiles;

  InfluencersGrid({super.key})
      : businessProfiles = List.generate(
            10,
            (index) => BusinessProfile(
                  id: '$index',
                  name: 'Influencer $index',
                  imageUrl:
                      'https://i.postimg.cc/BnqKZ6Dn/pexels-liza-summer-6347558.png',
                  description: 'username$index',
                  type: 'Influencer',
                  views: 1000,
                ));

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isLargeScreen ? 4 : 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemCount: businessProfiles.length,
      itemBuilder: (context, index) {
        return BusinessProfileCard(profile: businessProfiles[index]);
      },
    );
  }
}
