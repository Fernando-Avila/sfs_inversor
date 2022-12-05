part of 'user_bloc.dart';

enum AuthStates { lost_connection, none_user, registered_user, new_install }

abstract class UserState {
  const UserState(
      {this.user, this.authstate = AuthStates.none_user, this.authtoken});
  final AuthStates authstate;
  final User? user;
  final String? authtoken;
}

class UserInitial extends UserState {
  const UserInitial()
      : super(user: null, authstate: AuthStates.none_user, authtoken: null);
}

class UserNewApp extends UserState {
  const UserNewApp()
      : super(user: null, authstate: AuthStates.new_install, authtoken: null);
}

class UserSetState extends UserState {
  final AuthStates authstate;
  final User? user;
  final String? authtoken;
  @override
  const UserSetState(
      {required this.authstate, required this.user, required this.authtoken})
      : super(user: user, authstate: authstate, authtoken: authtoken);
}
