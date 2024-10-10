import '../entities/influencer_profile.dart';

abstract class InfluencerProfileRepository {
  Future<InfluencerProfile> fetchInfluencerProfile();
}
