import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'business_owner_home_state.dart';

class BusinessOwnerHomeCubit extends Cubit<BusinessOwnerHomeState> {
  BusinessOwnerHomeCubit() : super(BusinessOwnerHomeInitial());
}
