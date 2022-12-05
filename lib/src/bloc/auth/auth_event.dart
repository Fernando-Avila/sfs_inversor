part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthChangeEvent extends AuthEvent {
  final AuthStates authStates;
  AuthChangeEvent({required this.authStates});
  @override
  // TODO: implement props
  List<Object> get props => [authStates];
}
