import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../cubits/influencer_profile/influencer_profile_cubit.dart';
import 'influencer_rating.dart';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:viksera/features/home/domain/entities/influencer_profile.dart'; // Ensure correct import

class InfluencerProfileWidget extends StatelessWidget {
  final InfluencerProfile profile;

  InfluencerProfileWidget({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(profile.name),
        Text(profile.bio),
        InfluencerPostsWidget(posts: profile.postImages),
        InfluencerRatingWidget(rating: profile.rating),
        SimilarInfluencersWidget(similarInfluencers: profile.similarInfluencers),
      ],
    );
  }
}

class InfluencerPostsWidget extends StatelessWidget {
  final List<String> posts;

  InfluencerPostsWidget({required this.posts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: posts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return CachedNetworkImage(imageUrl: posts[index]);
      },
    );
  }
}

class InfluencerRatingWidget extends StatelessWidget {
  final double rating;

  InfluencerRatingWidget({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Rating: $rating"),
        Icon(Icons.star, color: Colors.yellow),
      ],
    );
  }
}

class SimilarInfluencersWidget extends StatelessWidget {
  final List<String> similarInfluencers;

  SimilarInfluencersWidget({required this.similarInfluencers});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: similarInfluencers.map((url) {
        return CachedNetworkImage(imageUrl: url);
      }).toList(),
    );
  }
}
