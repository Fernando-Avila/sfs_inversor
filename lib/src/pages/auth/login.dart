import 'package:flutter/material.dart';
import 'package:sfs_inversor/generated/l10n.dart';
import 'package:sfs_inversor/src/global/routes.dart';
import 'package:sfs_inversor/src/services/Functions.dart';
import 'package:sfs_inversor/src/controller/UserController.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';
import 'package:sfs_inversor/src/widgets/layouts/Textfield.dart';
import 'package:sfs_inversor/src/widgets/layouts/buttons.dart';
import 'package:sfs_inversor/src/widgets/layouts/extras.dart';
import 'package:sfs_inversor/src/widgets/widgettext.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  UserController _con = new UserController();
  @override
  Widget build(BuildContext context) {
    _con.context = context;
    return Scaffold(
      body: body(),

      ///  drawer: Drawer(),
    );
  }

  Widget body() {
    return ListView(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            gradient: EstiloApp.verticalPinkPurple,
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              H3(
                text: S.of(context).welcome,
                color: EstiloApp.colorwhite,
                fontWeight: FontWeight.w300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/iconlogo.png',
                    width: 120,
                  ),
                  D2(
                      text: 'SFS',
                      color: EstiloApp.colorwhite,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ],
              )
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Form(
            key: _con.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Textfield(
                  controlador: _con.email,
                  placeholder: S.of(context).mail,
                  validator: (value) {
                    return emailvalidator(value!, context);
                  },
                ),
                szv(20),
                Textfield(
                  controlador: _con.pass,
                  placeholder: S.of(context).password,
                  hintext: '*********',
                  obscuretext: _con.visiblepass,
                  suffixicon: IconButton(
                      onPressed: () {
                        setState(() {
                          _con.visiblepass = !_con.visiblepass;
                        });
                      },
                      icon: Icon(
                        _con.visiblepass
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Theme.of(context).iconTheme.color,
                      )),
                ),
                szv(40),
                BtnBlue(
                    metod: () {
                      _con.loginFormKey.currentState!.validate();
                    },
                    widget: t2(
                      text: S.of(context).login,
                      color: EstiloApp.colorwhite,
                    ),
                    width: 0.35,
                    height: 45),
                TextButton(
                  onPressed: () => print('text'),
                  child: t1(
                    text: S.of(context).forgotpass,
                    color: EstiloApp.primaryblue,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    t2(
                      text: S.of(context).notaccount,
                      color: EstiloApp.primaryblue,
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          Routes()
                              .Push(Routes().register, AnimatedPage.fade, 800)),
                      child: t1(
                        text: S.of(context).singup,
                        color: EstiloApp.primaryblue,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
