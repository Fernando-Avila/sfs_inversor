import 'package:flutter/material.dart';
import 'package:sfs_inversor/src/pages/account/account.dart';
import 'package:sfs_inversor/src/pages/auth/login.dart';
import 'package:sfs_inversor/src/pages/auth/register.dart';
import 'package:sfs_inversor/src/pages/auth/termsandconditions.dart';
import 'package:sfs_inversor/src/pages/extra/errorpage.dart';
import 'package:sfs_inversor/src/pages/home/page1.dart';
import 'package:sfs_inversor/src/pages/home/home.dart';
import 'package:sfs_inversor/src/pages/notifycation/notification.dart';
import 'package:sfs_inversor/src/pages/principal/intro.dart';
import 'package:sfs_inversor/src/pages/principal/splashScreen.dart';

enum AnimatedPage {
  slide,
  scale,
  fade,
  rotation,
  slideright,
  slidetopright,
  sliderightfade,
}

class ClassName {}

class Routes {
  String intro = '/intro';
  String login = '/login';
  String register = '/register';
  String terms = '/termsconditions';
  String errorc = '/errorconection';
  String home = '/home';
  String account = '/account';
  String notification = '/notification';
  String splash = '/splash';
  Map<String, WidgetBuilder> routes() {
    return {
      SplashScreen.id: (context) => SplashScreen(),
      intro: (context) => Intro(),
      login: (context) => Login(),
      register: (context) => Register(),
      terms: (context) => Termsandconditions(),
      errorc: (context) => Errorpage(),
      home: (context) => Home(),
      account: (context) => Account(),
      notification: (context) => Notifications(),
      splash: (context) => SplashScreen(),
    };
  }

  Rout(String page) {
    var map = {
      'page2': Page1(),
      intro: Intro(),
      login: Login(),
      register: Register(),
      terms: Termsandconditions(),
      errorc: Errorpage(),
      home: Home(),
      account: Account(),
      notification: Notifications(),
      splash: SplashScreen(),
    };
    return map[page] ?? Intro();
  }

  Route Push(String page, AnimatedPage animatedpage, int milliseconds) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: milliseconds),
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          Rout(page),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return navigator(child, animation, animatedpage);
      },
    );
  }

  navigator(Widget child, Animation<double> animation, AnimatedPage animated) {
    final curveAnimation =
        CurvedAnimation(parent: animation, curve: Curves.easeInOut);
    var map = {
      AnimatedPage.slide: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0.5, 1.0), end: Offset.zero)
            .animate(curveAnimation),
        child: child,
      ),
      AnimatedPage.slideright: SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(0.5, -0.0), end: Offset.zero)
                .animate(curveAnimation),
        child: child,
      ),
      AnimatedPage.scale: ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation),
        child: child,
      ),
      AnimatedPage.rotation: RotationTransition(
        turns: Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation),
        child: child,
      ),
      AnimatedPage.fade: FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation),
        child: child,
      ),
      AnimatedPage.slidetopright: FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation),
        child: SlideTransition(
          position:
              Tween<Offset>(begin: const Offset(0.5, -1.0), end: Offset.zero)
                  .animate(curveAnimation),
          child: child,
        ),
      ),
      AnimatedPage.sliderightfade: FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation),
        child: SlideTransition(
          position:
              Tween<Offset>(begin: const Offset(0.5, -0.0), end: Offset.zero)
                  .animate(curveAnimation),
          child: child,
        ),
      ),
      /*AnimatedPage.slidetopright: SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(0.5, -1.0), end: Offset.zero)
                .animate(curveAnimation),
        child: child,
      )*/
    };
    return map[animated];
  }
}
