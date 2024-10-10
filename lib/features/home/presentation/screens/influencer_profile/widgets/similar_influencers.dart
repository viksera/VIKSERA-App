import 'package:flutter/material.dart';
import '../../../../domain/entities/influencer_profile.dart';
import '../../business_owner_home/widgets/influencer_card.dart';

class SimilarInfluencers extends StatelessWidget {
  final List<InfluencerProfile> similarInfluencers;

  const SimilarInfluencers({Key? key, required this.similarInfluencers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text('Similar Influencers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: similarInfluencers.length,
              itemBuilder: (context, index) {
                return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: InfluencerCard());
              },
            ),
          ),
        ],
      ),
    );
  }
}
