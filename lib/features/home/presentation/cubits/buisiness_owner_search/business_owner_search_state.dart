part of 'business_owner_search_cubit.dart';

class BusinessOwnerSearchState {
  final String? searchText;
  final List<String> selectedCategory;
  final double minPrice;
  final double maxPrice;

  BusinessOwnerSearchState({
    this.searchText,
    this.selectedCategory = const [],
    this.minPrice = 1000,
    this.maxPrice = 10000,
  });

  List<Object?> get props => [searchText, minPrice, maxPrice, selectedCategory];
  BusinessOwnerSearchState copyWith({
    String? searchText,
    List<String>? selectedCategory,
    double? minPrice,
    double? maxPrice,
  }) {
    return BusinessOwnerSearchState(
      searchText: searchText ?? this.searchText,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
    );
  }
}
