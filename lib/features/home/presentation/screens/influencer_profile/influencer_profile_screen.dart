import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/features/home/presentation/screens/influencer_profile/widgets/similar_influencers.dart';
import '../../../../../config/typography/app_styles.dart';
import '../../cubits/influencer_profile/influencer_profile_cubit.dart';
import '../../cubits/influencer_profile/influencer_profile_state.dart';
import 'widgets/influencer_post.dart';
import 'widgets/influencer_profile_header.dart';
import 'widgets/influencer_rating.dart';

class InfluencerProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InfluencerProfileCubit()..fetchInfluencerProfile(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBackgroundColor,
          leading: const BackButton(),
        ),
        body: BlocBuilder<InfluencerProfileCubit, InfluencerProfileState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.errorMsg.isNotEmpty) {
              return Center(child: Text(state.errorMsg));
            } else if (state.influencerProfile != null) {
              final profile = state.influencerProfile!;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileHeader(profile: profile).pSymmetric(horizontal: 20),
                    InfluencerPostsWidget(posts: profile.postImages)
                        .pSymmetric(horizontal: 20),
                    20.heightBox,
                    Ratings(profile: profile).pSymmetric(horizontal: 20),
                    10.heightBox,
                    Text(
                      "Similar influencers",
                      style: AppStyles.style18.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ).pOnly(left: 20),
                    20.heightBox,
                    SimilarInfluencersWidget(
                        similarInfluencers: profile.similarInfluencers),
                    20.heightBox,
                  ],
                ),
              );
            }
            return const Center(child: Text('No Profile Found'));
          },
        ),
      ),
    );
  }
}
