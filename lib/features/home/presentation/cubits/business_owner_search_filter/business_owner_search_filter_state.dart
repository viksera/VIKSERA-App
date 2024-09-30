part of 'business_owner_search_filter_cubit.dart';

@immutable
sealed class BusinessOwnerSearchFilterState {}

final class BusinessOwnerSearchFilterInitial extends BusinessOwnerSearchFilterState {}

final class BusinessOwnerSearchFilterLoaded extends BusinessOwnerSearchFilterState {
  final String selectedCategory;
  final double minPrice;
  final double maxPrice;

  BusinessOwnerSearchFilterLoaded({
    required this.selectedCategory,
    required this.minPrice,
    required this.maxPrice,
  });

  BusinessOwnerSearchFilterLoaded copyWith({
    String? selectedCategory,
    double? minPrice,
    double? maxPrice,
  }) {
    return BusinessOwnerSearchFilterLoaded(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
    );
  }
}
