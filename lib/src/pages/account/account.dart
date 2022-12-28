import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:sfs_inversor/generated/l10n.dart';
import 'package:sfs_inversor/src/bloc/user/user_bloc.dart';
import 'package:sfs_inversor/src/controller/account/account_controller.dart';
import 'package:sfs_inversor/src/global/routes.dart';
import 'package:sfs_inversor/src/pages/account/sliver_body_investments.dart';
import 'package:sfs_inversor/src/pages/notifycation/ui/sliver_body_items.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';
import 'package:sfs_inversor/src/widgets/exportwidgets.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final drawerControl = ZoomDrawerController();
  final bloc = AccountController();
  @override
  void initState() {
    // TODO: implement initState
    bloc.init();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    drawerControl.toggle!(forceToggle: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBloc()..init(),
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state.user == null) {
            //  Navigator.pushReplacement(context,
            //    Routes().Push(Routes().login, AnimatedPage.slideright, 300));
          }
        },
        builder: (context, state) {
          return ZoomDrawerZ(
              drawerController: drawerControl,
              child: Scaffold(
                body: NotificationListener(
                    onNotification: (scroll) {
                      if (scroll is ScrollUpdateNotification) {
                        bloc.valueScroll.value = scroll.metrics.extentInside;
                      }
                      return true;
                    },
                    child: Scrollbar(
                        radius: const Radius.circular(8),
                        child: ValueListenableBuilder(
                          valueListenable: bloc.globalOffsetValue,
                          builder: (_, double valueCurrentScroll, __) {
                            return CustomScrollView(
                              physics: const BouncingScrollPhysics(),
                              controller: bloc.scrollControllerGlobally,
                              slivers: [
                                _FlexibleSpaceBarHeader(
                                  valueScroll: valueCurrentScroll,
                                  bloc: bloc,
                                  drawerControl: drawerControl,
                                ),
                                SliverPersistentHeader(
                                    pinned: true,
                                    delegate: _HeaderSliver(
                                      bloc: bloc,
                                      drawerControl: drawerControl,
                                    )),
                                SliverBodyInvestments(
                                    listItem: bloc.listInvestment)
                              ],
                            );
                          },
                        ))),
              ));
        },
      ),
    );
  }
}

class _FlexibleSpaceBarHeader extends StatelessWidget {
  const _FlexibleSpaceBarHeader({
    Key? key,
    required this.valueScroll,
    required this.bloc,
    required this.drawerControl,
  }) : super(key: key);
  final double valueScroll;
  final AccountController bloc;
  final ZoomDrawerController drawerControl;
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      stretch: true,
      expandedHeight: MediaQuery.of(context).size.height / 2,
      //pinned: true,
      pinned: valueScroll < 90 ? true : false,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.blurBackground
        ],
        background: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              color: EstiloApp.primaryblue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: EstiloApp.colorwhite,
                    radius: 60,
                    child: Icon(
                      color: EstiloApp.primarypink,
                      Icons.person,
                      size: 120,
                    ),
                  ),
                  H3(
                      color: EstiloApp.colorwhite,
                      fontWeight: FontWeight.w300,
                      text: 'Nombre'.toUpperCase()),
                  t1(
                    text: 'Correo'.toUpperCase(),
                    fontWeight: FontWeight.w300,
                    color: EstiloApp.colorwhite,
                  ),
                  Container(
                      decoration: EstiloApp.decorationBoxwhite,
                      constraints: const BoxConstraints(minWidth: 300),
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        //mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          t2(
                            text: 'Fondos'.toUpperCase(),
                            color: EstiloApp.primaryblue,
                          ),
                          szv(5),
                          H3(
                            text: S.of(context).currency(0),
                            fontWeight: FontWeight.bold,
                            color: EstiloApp.primaryblue,
                          ),
                          szv(5),
                          IntrinsicWidth(
                            child: BtnDegraded(
                              metod: () {},
                              radius: 6,
                              widget: t3(
                                text: 'Ingresar'.toUpperCase(),
                                fontWeight: FontWeight.w400,
                                color: EstiloApp.colorwhite,
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            Positioned(
              right: 10,
              top: (sizeHeight + 25) - bloc.valueScroll.value,
              //   top: 10,
              child: ActionNotification(),
            ),
            Positioned(
              left: 10,
              //  top: 10,
              top: (sizeHeight + 25) - bloc.valueScroll.value,
              child: IconButton(
                  onPressed: () => drawercontrol(drawerControl),
                  icon: const Icon(Icons.menu)),
            ),
          ],
        ),
      ),
    );
  }
}

const _maxHeaderExtent = 80.0;

class _HeaderSliver extends SliverPersistentHeaderDelegate {
  _HeaderSliver({required this.bloc, required this.drawerControl});
  final AccountController bloc;
  final ZoomDrawerController drawerControl;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final poitioned = bloc.scrollControllerGlobally.position.pixels;
    final percent = shrinkOffset / _maxHeaderExtent;
    final sizeHeight = MediaQuery.of(context).size.height;
    final isvisible = poitioned > sizeHeight / 2 ? true : false;
    if (percent > 0) {
      bloc.visibleHeader.value = true;
    } else {
      bloc.visibleHeader.value = false;
    }
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: InkWell(
            onTap: () {
              print(poitioned);
              print(sizeHeight / 2);
              print(isvisible);
            },
            child: AnimatedContainer(
              height: // percent > 0.01 ? _maxHeaderExtent : _maxHeaderExtent - 20,
                  _maxHeaderExtent,
              color:
                  percent > 0.01 ? EstiloApp.primaryblue : EstiloApp.colorwhite,
              duration: const Duration(milliseconds: 300),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  szv(20),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: AnimatedOpacity(
                                opacity: percent > 0.01 ? 1 : 0,
                                duration: const Duration(milliseconds: 300),
                                child: AnimatedSlide(
                                  duration: const Duration(milliseconds: 300),
                                  offset:
                                      Offset(0.0, percent > 0.01 ? -0.1 : -1.2),
                                  curve: Curves.easeIn,
                                  child: IconButton(
                                      onPressed: () =>
                                          drawercontrol(drawerControl),
                                      icon: const Icon(Icons.menu)),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 6,
                              child: AnimatedCrossFade(
                                  firstCurve: Curves.easeIn,
                                  secondChild: AnimatedSlide(
                                    duration: const Duration(milliseconds: 400),
                                    offset:
                                        Offset(percent > 0.0 ? 0.0 : 1, 0.0),
                                    curve: Curves.easeIn,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        szh(5),
                                        CircleAvatar(
                                          backgroundColor: EstiloApp.colorwhite,
                                          radius: 20,
                                          child: Icon(
                                            color: EstiloApp.primarypink,
                                            Icons.person,
                                            size: 40,
                                          ),
                                        ),
                                        szh(5),
                                        t3(
                                          text: S.of(context).currency(0),
                                          fontWeight: FontWeight.bold,
                                          color: EstiloApp.colorwhite,
                                        ),
                                      ],
                                    ),
                                  ),
                                  firstChild: Center(
                                    child: t2(
                                        fontWeight: FontWeight.w500,
                                        color: EstiloApp.primaryblue,
                                        text: 'Últimas inversiones'
                                            .toUpperCase()),
                                  ),
                                  crossFadeState: percent > 0.01
                                      ? CrossFadeState.showSecond
                                      : CrossFadeState.showFirst,
                                  duration: const Duration(milliseconds: 300)),
                            ),
                            Flexible(
                              flex: 1,
                              child: AnimatedOpacity(
                                opacity: percent > 0.0 ? 1 : 0,
                                duration: const Duration(milliseconds: 300),
                                child: AnimatedSlide(
                                    duration: const Duration(milliseconds: 300),
                                    offset: Offset(
                                        0.0, percent > 0.0 ? -0.1 : -1.2),
                                    curve: Curves.easeIn,
                                    child: const ActionNotification()),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  //double get maxExtent => bloc.visibleHeader.value ? _maxHeaderExtent : 5;
  double get maxExtent => _maxHeaderExtent;
  //  bloc.iss ? _maxHeaderExtent + 30 : _maxHeaderExtent;
  @override
  //double get minExtent => bloc.visibleHeader.value ? _maxHeaderExtent : 5;
  //double get minExtent => _maxHeaderExtent;
  double get minExtent => _maxHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
