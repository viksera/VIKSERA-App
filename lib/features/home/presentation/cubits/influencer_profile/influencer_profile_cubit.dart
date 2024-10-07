import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/influencer_profile.dart';
import 'influencer_profile_state.dart';

class InfluencerProfileCubit extends Cubit<InfluencerProfileState> {
  InfluencerProfileCubit() : super(const InfluencerProfileState());

  void fetchInfluencerProfile() async {
    try {
      emit(state.copyWith(isLoading: true));

      final dummyProfile = InfluencerProfile(
        name: 'Liza Summer',
        bio: 'Hey guys... I will help you to grow your business',
        type: 'Food & Drinks',
        popularity: 10,
        rating: 5.0,
        postImages: [
          'https://tse1.mm.bing.net/th?id=OIP.XK0XJsd_h9qS7CU9WGvtUAHaFE&pid=Api&P=0&h=180',
          'https://tse1.mm.bing.net/th?id=OIP.XK0XJsd_h9qS7CU9WGvtUAHaFE&pid=Api&P=0&h=180',
          'https://tse1.mm.bing.net/th?id=OIP.XK0XJsd_h9qS7CU9WGvtUAHaFE&pid=Api&P=0&h=180',
          'https://tse1.mm.bing.net/th?id=OIP.XK0XJsd_h9qS7CU9WGvtUAHaFE&pid=Api&P=0&h=180',
          'https://tse1.mm.bing.net/th?id=OIP.XK0XJsd_h9qS7CU9WGvtUAHaFE&pid=Api&P=0&h=180',
          'https://tse1.mm.bing.net/th?id=OIP.XK0XJsd_h9qS7CU9WGvtUAHaFE&pid=Api&P=0&h=180',
        ],
        similarInfluencers: [],
        profileImage:
            'https://tse1.mm.bing.net/th?id=OIP.XK0XJsd_h9qS7CU9WGvtUAHaFE&pid=Api&P=0&h=180',
      );

      emit(state.copyWith(influencerProfile: dummyProfile, isLoading: false));
    } catch (e) {
      emit(
          state.copyWith(errorMsg: 'Failed to load profile', isLoading: false));
    }
  }
}
