part of 'business_owner_home_cubit.dart';

class BusinessOwnerHomeState {
  final FormzSubmissionStatus status;
  final String msg;
  final String? searchText;
  final int bannerIndex;
  const BusinessOwnerHomeState(
      {this.status = FormzSubmissionStatus.initial,
      this.msg = '',
      this.searchText,
      this.bannerIndex = 0});
  List<Object?> get props => [status, msg, searchText, bannerIndex];
  BusinessOwnerHomeState copyWith(
          {FormzSubmissionStatus? status,
          String? msg,
          String? searchText,
          int? bannerIndex}) =>
      BusinessOwnerHomeState(
        status: status ?? this.status,
        msg: msg ?? this.msg,
        searchText: searchText ?? this.searchText,
        bannerIndex: bannerIndex ?? this.bannerIndex,
      );
}
