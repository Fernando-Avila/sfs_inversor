import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthChangeEvent, AuthInitial> {
  AuthBloc() : super(AuthInitial(authStates: AuthStates.registered_user)) {
    on<AuthChangeEvent>(
        (event, emit) => emit(AuthInitial(authStates: event.authStates)));
  }
  Future<void> initialice() async {
    await Future.delayed(const Duration(seconds: 5));
    print('Se acabo el tiempo');
    AuthBloc().add(AuthChangeEvent(authStates: AuthStates.none_user));
    AuthBloc().addError(isClosed);
  }
}
