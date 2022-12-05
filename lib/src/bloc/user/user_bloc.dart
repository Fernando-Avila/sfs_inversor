import 'package:bloc/bloc.dart';
import 'package:sfs_inversor/src/device/sharedpreferences.dart';
import 'package:sfs_inversor/src/models/user_model.dart';
import 'package:sfs_inversor/src/controller/UserController.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) {});
    on<UserCloseSessionEvent>((event, emit) {
      emit(UserInitial());
    });
    on<UserLoginEvent>((event, emit) {
      emit(UserSetState(
          authstate: event.authstate,
          authtoken: event.authtoken,
          user: event.user));
    });
    on<UserNewAppEvent>((event, emit) {
      emit(UserNewApp());
    });
  }
  void init() async {
    var existapp = await getdataShared('appinstalled');
    if (!existapp.exist) return add(UserNewAppEvent());
    var authtoken = await getdataShared('authtoken');
    if (!authtoken.exist) return add(UserCloseSessionEvent());
    var data = await UserController().verifyuser('auttoken');
    await setdataString('appinstalled', 'value');
    add(UserLoginEvent(user: data[0], authstate: data[1], authtoken: data[2]));
  }
}
