import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'influencer_home_state.dart';

class InfluencerHomeCubit extends Cubit<InfluencerHomeState> {
  InfluencerHomeCubit() : super(InfluencerHomeInitial());
}
