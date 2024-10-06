class InfluencerProfile {
  final String name;
  final String bio;
  final String type;
  final String profileImage;
  final int popularity;
  final double rating;
  final List<String> postImages;
  final List<String> similarInfluencers;

  InfluencerProfile({
    required this.profileImage,
    required this.name,
    required this.bio,
    required this.type,
    required this.popularity,
    required this.rating,
    required this.postImages,
    required this.similarInfluencers,
  });
}
