import 'package:flutter_bloc/flutter_bloc.dart';

class UserSelectionCubit extends Cubit<bool> {
  UserSelectionCubit() : super(true);

  void onUserChanged() {
    emit(!state);
  }
}
