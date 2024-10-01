import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'business_owner_search_filter_state.dart';

class BusinessOwnerSearchFilterCubit
    extends Cubit<BusinessOwnerSearchFilterState> {
  BusinessOwnerSearchFilterCubit() : super(BusinessOwnerSearchFilterInitial());

  //! Function to update the category
  void updateCategory(String category) {
    if (state is BusinessOwnerSearchFilterLoaded) {
      final currentState = state as BusinessOwnerSearchFilterLoaded;
      emit(currentState.copyWith(selectedCategory: category));
    } else {
      emit(BusinessOwnerSearchFilterLoaded(
        selectedCategory: category,
        minPrice: 0,
        maxPrice: 1000,
      ));
    }
  }

  //! Function to update the price range
  void updatePriceRange(double minPrice, double maxPrice) {
    if (state is BusinessOwnerSearchFilterLoaded) {
      final currentState = state as BusinessOwnerSearchFilterLoaded;
      emit(currentState.copyWith(minPrice: minPrice, maxPrice: maxPrice));
    } else {
      emit(BusinessOwnerSearchFilterLoaded(
        selectedCategory: 'All',
        minPrice: minPrice,
        maxPrice: maxPrice,
      ));
    }
  }
}
