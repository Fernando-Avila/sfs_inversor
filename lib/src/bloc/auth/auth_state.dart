part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  final AuthStates authStates;
  const AuthInitial({required this.authStates});
  @override
  List<Object> get props => [authStates];
}

enum AuthStates { lost_connection, none_user, registered_user }
