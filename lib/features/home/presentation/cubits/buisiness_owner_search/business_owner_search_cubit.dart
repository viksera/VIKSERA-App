import 'package:flutter_bloc/flutter_bloc.dart';

part 'business_owner_search_state.dart';

class BusinessOwnerSearchCubit extends Cubit<BusinessOwnerSearchState> {
  BusinessOwnerSearchCubit() : super(BusinessOwnerSearchState.initial());

  void onSearchTextChanged(String? value) {
    // if (value.isNotEmpty) {
    emit(state.copyWith(searchText: value));
    print(state.searchText);
    // }
  }
}
