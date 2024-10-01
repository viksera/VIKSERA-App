import 'package:flutter/material.dart';
import 'package:viksera/core/extensions/app_extensions.dart';

import '../../../../domain/entities/business_profile.dart';
import 'business_profile_card.dart';

class MarketingAgenciesGrid extends StatelessWidget {
  const MarketingAgenciesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isLargeScreen ? 4 : 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return BusinessProfileCard(
          profile: BusinessProfile(
            id: '1',
            name: 'Marketing Agency $index',
            imageUrl: 'https://i.postimg.cc/gk0pYbjP/pexels-rdne-7563686.png',
            type: 'Marketing Agency',
            rating: 4.5,
            location: 'New York',
          ),
        );
      },
    );
  }
}
