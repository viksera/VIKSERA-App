import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'business_owner_home_state.dart';

class BusinessOwnerHomeCubit extends Cubit<BusinessOwnerHomeState> {
  BusinessOwnerHomeCubit() : super(const BusinessOwnerHomeState());
  void onBannerIndexChanged(int index) {
    emit(state.copyWith(bannerIndex: index));
  }

  void onSearchTextChanged(String value) {
    if (value.isNotEmpty) {
      emit(state.copyWith(searchText: value));
    }
  }
}
