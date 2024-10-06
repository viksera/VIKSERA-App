import '../../../domain/entities/influencer_profile.dart';

class InfluencerProfileState {
  final InfluencerProfile? influencerProfile;
  final bool isLoading;
  final String errorMsg;

  const InfluencerProfileState({
    this.influencerProfile,
    this.isLoading = false,
    this.errorMsg = '',
  });

  InfluencerProfileState copyWith({
    InfluencerProfile? influencerProfile,
    bool? isLoading,
    String? errorMsg,
  }) {
    return InfluencerProfileState(
      influencerProfile: influencerProfile ?? this.influencerProfile,
      isLoading: isLoading ?? this.isLoading,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  List<Object?> get props => [influencerProfile, isLoading, errorMsg];
}
