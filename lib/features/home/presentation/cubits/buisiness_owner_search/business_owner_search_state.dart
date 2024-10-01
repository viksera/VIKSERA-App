part of 'business_owner_search_cubit.dart';

class BusinessOwnerSearchState {
  final String? searchText;

  BusinessOwnerSearchState({
    required this.searchText,
  });

  factory BusinessOwnerSearchState.initial() {
    return BusinessOwnerSearchState(
      searchText: '',
    );
  }

  BusinessOwnerSearchState copyWith({String? searchText}) {
    return BusinessOwnerSearchState(
      searchText: searchText ?? this.searchText,
    );
  }
}
