
//! BusinessProfile entity is used to model the data being
//! searched, viewed, or interacted by the business owner can expand in the future.

class BusinessProfile {
  final String id;
  final String name;
  final String imageUrl;
  final String? description; // Only for agencies
  final String type; // 'Influencer' OR 'Marketing Agency'
  final int? views; //  for influencers
  final String? instagramUsername; //for influencers
  final double? rating; //  for marketing agencies
  final String? location; //  for  agency /influencer

  BusinessProfile({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.description,
    required this.type,
    this.views,
    this.instagramUsername,
    this.rating,
    this.location,
  });
}
