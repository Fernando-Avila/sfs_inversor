import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:sfs_inversor/src/bloc/auth/auth_bloc.dart';
import 'package:sfs_inversor/src/bloc/user/user_bloc.dart';
//import 'package:sfs_inversor/src/cubit/auth/auth_cubit.dart';
import 'package:sfs_inversor/src/global/routes.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String id = '/splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /* return BlocProvider(
      create: (_) => AuthCubit()..init(),
      child: BlocListener<AuthCubit, AuthStates>(
        listener: (context, snapshot) async {
          if (snapshot == AuthStates.none_user) {
            await Future.delayed(Duration(seconds: 2));
            // ignore: use_build_context_synchronously
            Navigator.pushAndRemoveUntil(
                context,
                Routes().Push(Routes().intro, AnimatedPage.fade, 2000),
                (route) => false);
          } else {}
        },
        child: Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/degradado/iconlogo.png',
                scale: 2,
              ),
              CircularProgressIndicator(
                color: EstiloApp.colorwhite,
                backgroundColor: EstiloApp.primarypurple,
              )
            ],
          ),
        )),
      ),
    );*/
    return BlocProvider(
      create: (_) => UserBloc()..init(),
      child: BlocListener<UserBloc, UserState>(
        listener: (context, snapshot) async {
          await Future.delayed(Duration(seconds: 2));
          var authstate = snapshot.authstate;
          print(authstate);
          switch (authstate) {
            case AuthStates.none_user:
              Navigator.pushAndRemoveUntil(
                  context,
                  Routes().Push(Routes().intro, AnimatedPage.fade, 2000),
                  (route) => false);
              break;
            case AuthStates.lost_connection:
              Navigator.pushAndRemoveUntil(
                  context,
                  Routes().Push(Routes().errorc, AnimatedPage.fade, 2000),
                  (route) => false);
              break;
            default:
              Navigator.pushAndRemoveUntil(
                  context,
                  Routes().Push(Routes().intro, AnimatedPage.fade, 2000),
                  (route) => false);
          }
        },
        child: Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/degradado/iconlogo.png',
                scale: 2,
              ),
              CircularProgressIndicator(
                color: EstiloApp.colorwhite,
                backgroundColor: EstiloApp.primarypurple,
              )
            ],
          ),
        )),
      ),
    );
  }
}
