import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

part 'business_owner_home_state.dart';

class BusinessOwnerHomeCubit extends Cubit<BusinessOwnerHomeState> {
  BusinessOwnerHomeCubit() : super(const BusinessOwnerHomeState());
  void onBannerIndexChanged(int index) {
    emit(state.copyWith(bannerIndex: index));
  }

}
