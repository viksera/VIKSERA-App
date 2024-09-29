import '../../domain/entities/business_profile.dart';
import '../../domain/repositories/buisiness_profile_repository.dart';
import '../datasources/buisiness_profile_api.dart';

class BusinessProfileRepositoryImpl implements BusinessProfileRepository {
  final BusinessProfileApi api;

  BusinessProfileRepositoryImpl(this.api);

  @override
  Future<List<BusinessProfile>> fetchProfiles(String type) async {
//TODO implement fetchProfiles after api ready
    final profiles = await api.fetchProfiles(type);
    return profiles;
  }
}
