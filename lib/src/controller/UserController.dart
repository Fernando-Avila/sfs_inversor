import 'package:flutter/cupertino.dart';

import 'package:sfs_inversor/src/bloc/user/user_bloc.dart';
import 'package:sfs_inversor/src/models/user_model.dart';

class UserController {
  late BuildContext context;
  final email = TextEditingController();
  final name = TextEditingController();
  final lastname = TextEditingController();
  final pass = TextEditingController();
  final passverify = TextEditingController();
  final phone = TextEditingController();
  bool visiblepass = true;
  bool verifypassword = false;
  GlobalKey<FormState> loginFormKey = GlobalKey();
  GlobalKey<FormState> registerFormKey = GlobalKey();

  Future RegisterUser() async {
    print(email.text);
  }

  Future verifyuser(String token) async {
    return [User(), AuthStates.registered_user, 'ss'];
  }
}
