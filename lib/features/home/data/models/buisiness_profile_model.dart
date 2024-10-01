import '../../domain/entities/business_profile.dart';

//! BusinessProfile represents what the business owner is searching for 

class BusinessProfileModel extends BusinessProfile {
  BusinessProfileModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.description,
    required super.type,
    required super.views,
  });

  factory BusinessProfileModel.fromJson(Map<String, dynamic> json) {
    return BusinessProfileModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      type: json['type'],
      views: json['views'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'type': type,
    };
  }
}
