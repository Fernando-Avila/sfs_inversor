part of 'user_bloc.dart';

abstract class UserEvent {
  const UserEvent();
}

class UserLoginEvent extends UserEvent {
  final AuthStates authstate;
  final User? user;
  final String? authtoken;
  UserLoginEvent(
      {required this.authstate, required this.user, required this.authtoken});
}

class UserCloseSessionEvent extends UserEvent {
  UserCloseSessionEvent();
}

class UserNewAppEvent extends UserEvent {
  UserNewAppEvent();
}
