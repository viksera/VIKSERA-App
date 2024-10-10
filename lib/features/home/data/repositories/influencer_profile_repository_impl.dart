import '../../domain/entities/influencer_profile.dart';
import '../../domain/repositories/influencer_repository.dart';

class InfluencerProfileRepositoryImpl implements InfluencerProfileRepository {
  @override
  Future<InfluencerProfile> fetchInfluencerProfile() async {
//TODO dummy change
    return InfluencerProfile(
      name: "Liza Summer",
      bio: "Hey guys... I will help you to grow your business",
      type: "Food & Drinks",
      popularity: 1000000,
      profileImage: '',
      rating: 5.0,
      postImages: [
        'https://tse1.mm.bing.net/th?id=OIP.XK0XJsd_h9qS7CU9WGvtUAHaFE&pid=Api&P=0&h=180',
        'https://tse1.mm.bing.net/th?id=OIP.XK0XJsd_h9qS7CU9WGvtUAHaFE&pid=Api&P=0&h=180',
        'https://tse1.mm.bing.net/th?id=OIP.XK0XJsd_h9qS7CU9WGvtUAHaFE&pid=Api&P=0&h=180',
        'https://tse1.mm.bing.net/th?id=OIP.XK0XJsd_h9qS7CU9WGvtUAHaFE&pid=Api&P=0&h=180',
      ],
      similarInfluencers: [
        'https://tse1.mm.bing.net/th?id=OIP.XK0XJsd_h9qS7CU9WGvtUAHaFE&pid=Api&P=0&h=180',
        'https://tse1.mm.bing.net/th?id=OIP.XK0XJsd_h9qS7CU9WGvtUAHaFE&pid=Api&P=0&h=180',
      ],
    );
  }
}
