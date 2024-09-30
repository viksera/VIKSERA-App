
import '../entities/business_profile.dart';

abstract class BusinessProfileRepository {
  Future<List<BusinessProfile>> fetchProfiles(String type);
}
