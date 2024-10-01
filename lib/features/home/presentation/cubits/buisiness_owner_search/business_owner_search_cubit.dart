import 'package:flutter_bloc/flutter_bloc.dart';

part 'business_owner_search_state.dart';

class BusinessOwnerSearchCubit extends Cubit<BusinessOwnerSearchState> {
  BusinessOwnerSearchCubit() : super(BusinessOwnerSearchState());

  void onSearchTextChanged(String value) {
    if (value.isNotEmpty) {
      emit(state.copyWith(searchText: value));
    }
  }

  //! Function to update the category
  void updateCategory(String category) {
    List<String> temp = List.from(state.selectedCategory);
    if (temp.contains(category)) {
      temp.remove(category);
    } else {
      temp.add(category);
    }
    emit(state.copyWith(selectedCategory: temp));
  }

  //! Function to update the price range
  void updatePriceRange(double minPrice, double maxPrice) {
    emit(state.copyWith(minPrice: minPrice, maxPrice: maxPrice));
  }
}
