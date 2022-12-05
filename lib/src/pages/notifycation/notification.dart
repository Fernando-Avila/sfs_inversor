import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfs_inversor/src/bloc/notification/notification_bloc.dart';
import 'package:sfs_inversor/src/controller/notification_controller.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';
import 'package:sfs_inversor/src/widgets/widgettext.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {
  NotificationController _con = NotificationController();
  @override
  void initState() {
    // TODO: implement initState
    _con.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _con.context = context;
    return Scaffold(
      body: Scrollbar(
        notificationPredicate: (scroll) {
          _con.valueScroll.value = scroll.metrics.extentInside;
          return true;
        },
        thumbVisibility: false,
        interactive: true,
        radius: const Radius.circular(10),
        child: ValueListenableBuilder(
            valueListenable: _con.globalOffsetValue,
            builder: (_, double valueCurentScroll, __) {
              return CustomScrollView(physics: BouncingScrollPhysics(),
                  //  controller: _con.scrollControllerGlobalty,
                  slivers: [
                    _FlexibleAPPBar(valueScroll: valueCurentScroll),
                    SliverPersistentHeader(
                        pinned: true, delegate: _HeeaderSliver(con: _con)),
                    for (var i = 0; i < 4; i++) ...[
                      SliverPersistentHeader(
                          delegate: NotifyHeader(categori: _con.Categorias[i])),
                      for (var i = 0; i < 4; i++) ...[
                        SliverPersistentHeader(delegate: NotifyHeader2()),
                      ]
                    ]
                  ]);
            }),
      ),
    );
    ;
    /*return Scaffold(
      //backgroundColor: EstiloApp.colorblack,
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: body(),
    );*/
  }

  Widget body() {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        return ListView(
          children: const [
            Dismissible(
                key: Key('s'),
                child: ListTile(
                  leading: Text('sss'),
                )),
            Dismissible(
                key: Key('s'),
                child: ListTile(
                  leading: Text('sss'),
                )),
            Dismissible(
                key: Key('s'),
                child: ListTile(
                  leading: Text('sss'),
                )),
            Dismissible(
                key: Key('s'),
                child: ListTile(
                  leading: Text('sss'),
                )),
            Dismissible(
                key: Key('s'),
                child: ListTile(
                  leading: Text('sss'),
                )),
            Dismissible(
                key: Key('s'),
                child: ListTile(
                  leading: Text('sss'),
                )),
          ],
        );
      },
    );
  }
}

class NotifyHeader2 extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              color: EstiloApp.colorwhite,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: const [Icon(Icons.star), Icon(Icons.favorite)],
                  ),
                  Row(
                    children: const [Icon(Icons.star), Icon(Icons.favorite)],
                  ),
                ],
              ),
            ))
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 60;

  @override
  // TODO: implement minExtent
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class NotifyHeader extends SliverPersistentHeaderDelegate {
  final String categori;

  NotifyHeader({required this.categori});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [H3(text: categori)],
                  ),
                  Row(
                    children: const [Icon(Icons.star), Icon(Icons.favorite)],
                  ),
                ],
              ),
            ))
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 60;

  @override
  // TODO: implement minExtent
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class _HeeaderSliver extends SliverPersistentHeaderDelegate {
  final con;

  _HeeaderSliver({required this.con});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / 100;
    return Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              height: percent < 0.1 ? 0 : 100,
              color: EstiloApp.primaryblue,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      AnimatedSlide(
                        duration: Duration(milliseconds: 800),
                        offset: Offset(percent < 0.1 ? -0.20 : 1.1, 0),
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon:
                                const Icon(Icons.arrow_back_ios_new_outlined)),
                      ),
                      AnimatedSwitcher(
                          duration: Duration(seconds: 2),
                          child: percent < 0.1
                              ? LisCategoriesSliver(con: con)
                              : Text('s'))
                    ],
                  )
                ],
              ),
            )),
        /* AnimatedCrossFade(
          crossFadeState: percent > 0.1
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                color: EstiloApp.primaryblue,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_back_ios_new_outlined)),
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_back_ios_new_outlined)),
                      ],
                    )
                  ],
                ),
              )),
          secondChild: Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                color: EstiloApp.primaryblue,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.favorite)),
                  ],
                ),
              )),
          duration: Duration(milliseconds: 400),
        )
     */
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 100;

  @override
  // TODO: implement minExtent
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class LisCategoriesSliver extends StatelessWidget {
  final NotificationController con;
  const LisCategoriesSliver({Key? key, required this.con}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: con.Categorias.map((categori) {
        return t3(
          text: categori,
          color: EstiloApp.colorwhite,
        );
      }).toList(),
    );
  }
}

class _FlexibleAPPBar extends StatelessWidget {
  const _FlexibleAPPBar({Key? key, required this.valueScroll})
      : super(key: key);
  final double valueScroll;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: valueScroll < 90 ? true : false,
      automaticallyImplyLeading: false,
      stretch: true,
      backgroundColor: Colors.transparent,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        stretchModes: [StretchMode.blurBackground],
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/icons/degradado/iconlogo.png'),
            Positioned(
                left: 20,
                top: 25,
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios_new_outlined)))
          ],
        ),
      ),
    );
  }
}
