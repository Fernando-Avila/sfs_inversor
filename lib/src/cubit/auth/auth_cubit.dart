import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_state.dart';

enum AuthStates { lost_connection, none_user, registered_user }

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthStates.none_user);
  void init() async {
    await verifyuser();
    emit(AuthStates.none_user);
  }
}

Future verifyuser() async {
  final prefs = await SharedPreferences.getInstance();
  final String? statususer = prefs.getString('statususer');
  if (statususer == null) {
    return AuthStates.none_user;
  } else {
    return AuthStates.registered_user;
  }
}
