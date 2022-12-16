import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sfs_inversor/generated/l10n.dart';
import 'package:sfs_inversor/src/bloc/user/user_bloc.dart';
import 'package:sfs_inversor/src/global/routes.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';
import 'package:sfs_inversor/src/widgets/layouts/photo.dart';
import 'package:sfs_inversor/src/widgets/widgettext.dart';

final drawerController = ZoomDrawerController();
void drawercontrol() {
  if (drawerController.isOpen!()) {
    drawerController.close!();
  } else {
    drawerController.open!();
  }
}

class ZoomDrawerZ extends StatelessWidget {
  const ZoomDrawerZ({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: drawerController,
      menuScreen: DrawerC(),
      borderRadius: 24,
      mainScreenScale: 0.08,
      showShadow: true,
      androidCloseOnBackTap: true,
      mainScreenTapClose: true,
      openCurve: Curves.easeInOut,
      angle: 0.0,
      style: DrawerStyle.defaultStyle,
      menuBackgroundColor: EstiloApp.colorwhite,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.9),
          spreadRadius: 4,
          blurRadius: 6,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
      // drawerShadowsBackgroundColor: EstiloApp.primarypurple,
      slideWidth: MediaQuery.of(context).size.width * 0.6,
      mainScreen: child,
    );
  }
}

class DrawerC extends StatelessWidget {
  const DrawerC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.6,
          padding: EdgeInsets.zero,
          //  color: Theme.of(context).primaryColor,
          child: state.authtoken != null
              ? Column(
                  children: [
                    DrawerHeader(
                        curve: Curves.bounceInOut,
                        duration: const Duration(seconds: 2),
                        child: state.authtoken != null
                            ? UserAccountsDrawerHeader(
                                currentAccountPictureSize: Size(40, 40),
                                currentAccountPicture: const FotoPerfil(
                                  image: null,
                                  size: 80,
                                ),
                                accountName: const H3(text: 'Fernando'),
                                accountEmail: const H3(text: 'ss'),
                                arrowColor: EstiloApp.colorwhite,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Colors.white.withOpacity(0.2),
                                            BlendMode.dstATop),
                                        image: const AssetImage(
                                            'assets/icons/degradado/iconlogo.png'))),
                                onDetailsPressed: () => print('MoreDetail'),
                              )
                            : UserAccountsDrawerHeader(
                                currentAccountPicture: const FotoPerfil(
                                  size: 80,
                                  image: 1,
                                ),
                                accountName: H3(text: S.of(context).register),
                                accountEmail: const t1(text: ''),
                                arrowColor: EstiloApp.colorwhite,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Colors.white.withOpacity(0.2),
                                            BlendMode.dstATop),
                                        image: const AssetImage(
                                            'assets/icons/degradado/iconlogo.png'))),
                                onDetailsPressed: () => print(
                                    ModalRoute.of(context)!.settings.name),
                              )),
                  ],
                )
              : Column(
                  children: [
                    DrawerHeader(
                        curve: Curves.bounceInOut,
                        duration: const Duration(seconds: 2),
                        child: UserAccountsDrawerHeader(
                          currentAccountPicture: const FotoPerfil(
                            size: 80,
                            image: 1,
                          ),
                          accountName: t1(text: S.of(context).accouninvited),
                          arrowColor: Theme.of(context).backgroundColor,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      Colors.white.withOpacity(0.2),
                                      BlendMode.dstATop),
                                  image: const AssetImage(
                                      'assets/icons/degradado/iconlogo.png'))),
                          onDetailsPressed: () {
                            Navigator.push(
                                context,
                                Routes().Push(Routes().login,
                                    AnimatedPage.slideright, 300));
                          },
                          accountEmail: null,
                        )),
                    btn(3, 'assets/icons/degradado/iconsolicitud.png', 'Cuenta',
                        context),
                    btn(3, 'assets/icons/degradado/iconsolicitud.png',
                        'Calculadora', context),
                  ],
                ),
        );
      },
    );
    /* return Padding(
        padding: EdgeInsets.only(
            top: 30, right: MediaQuery.of(context).size.width * 0.40),
        child: Container(
          color: EstiloApp.colorwhite,
          /*   child: prov.logged
              ? us.type == 'Inversor'
                  ? ListView(
                      children: [
                        userinfo(MediaQuery.of(context).size.height * 0.25, us),
                        btn(1, 'asset/icons/degradado/iconlogo.png', 'Cuenta',
                            context),
                        btn(2, 'asset/icons/degradado/iconsocio.png',
                            'Tus Inversiones', context),
                        btn(3, 'asset/icons/degradado/iconsolicitud.png',
                            'Oportunidades', context),
                        btn(4, 'asset/icons/degradado/iconcalc.png',
                            'Calculadora', context),
                        btn(5, 'asset/icons/degradado/iconhand.png',
                            'Cerrar sesion', context)
                      ],
                    )
                  : ListView(
                      children: [
                        userinfo(MediaQuery.of(context).size.height * 0.25, us),
                        btn(1, 'asset/icons/degradado/iconlogo.png', 'Cuenta',
                            context),
                        btn(6, 'asset/icons/degradado/iconsocio.png',
                            'Tus Solicitudes', context),
                        btn(7, 'asset/icons/degradado/iconsolicitud.png',
                            'Crear solicitud', context),
                        btn(4, 'asset/icons/degradado/iconcalc.png',
                            'Calculadora', context),
                        btn(5, 'asset/icons/degradado/iconhand.png',
                            'Cerrar sesion', context)
                      ],
                    )
              : ListView(
                  children: [
                    userinfo(MediaQuery.of(context).size.height * 0.25, us),
                    btn(1, 'asset/icons/degradado/iconlogo.png', 'Cuenta',
                        context),
                    btn(3, 'asset/icons/degradado/iconsolicitud.png',
                        'Oportunidades', context),
                    btn(4, 'asset/icons/degradado/iconcalc.png', 'Calculadora',
                        context),
                  ],
                )),*/
        ));
 */
  }

  Widget btn(int op, String image, String title, context) {
    return InkWell(
        onTap: () => onTabTapped(op, context),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    image,
                    height: 35,
                  ),
                  SizedBox(width: 10),
                  t1(text: title)
                ],
              ),
              Divider(
                height: 10,
                thickness: 2,
                indent: 20,
                endIndent: 20,
                color: EstiloApp.primarypink,
              ),
            ],
          ),
        ));
  }

  void onTabTapped(int Index, context) {
    print(Index);
  }
}
