import 'package:flutter/material.dart';
import 'package:sfs_inversor/generated/l10n.dart';
import 'package:sfs_inversor/src/controller/notification_controller.dart';
import 'package:sfs_inversor/src/pages/notifycation/ui/background_sliver.dart';
import 'package:sfs_inversor/src/pages/notifycation/ui/list_item_header_sliver.dart';
import 'package:sfs_inversor/src/pages/notifycation/ui/my_header_title.dart';
import 'package:sfs_inversor/src/pages/notifycation/ui/sliver_body_items.dart';
import 'package:sfs_inversor/src/widgets/layouts/extras.dart';

import 'package:sfs_inversor/src/widgets/widgettext.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final bloc = SliverScrollController();

  @override
  void initState() {
    bloc.init();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.black,
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
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _HeaderSliver(bloc: bloc),
                      ),
                      for (var i = 0; i < bloc.listCategory.length; i++) ...[
                        SliverPersistentHeader(
                          delegate: MyHeaderTitle(
                            bloc.listCategory[i].category,
                            (visible) => bloc.refreshHeader(
                              i,
                              visible,
                              lastIndex: i > 0 ? i - 1 : null,
                            ),
                          ),
                        ),
                        SliverBodyItems(
                          listItem: bloc.listCategory[i].notifications,
                        )
                      ]
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class _FlexibleSpaceBarHeader extends StatelessWidget {
  const _FlexibleSpaceBarHeader({
    Key? key,
    required this.valueScroll,
    required this.bloc,
  }) : super(key: key);

  final double valueScroll;
  final SliverScrollController bloc;

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      stretch: true,
      expandedHeight: 250,
      pinned: valueScroll < 90 ? true : false,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        stretchModes: const [StretchMode.zoomBackground],
        background: Stack(
          fit: StackFit.expand,
          children: [
            const BackgroundSliver(),
            Positioned(
              right: 10,
              top: (sizeHeight + 20) - bloc.valueScroll.value,
              child: const Icon(Icons.favorite, size: 30),
            ),
            Positioned(
              left: 10,
              top: (sizeHeight + 20) - bloc.valueScroll.value,
              child: const Icon(Icons.arrow_back, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}

const _maxHeaderExtent = 100.0;

class _HeaderSliver extends SliverPersistentHeaderDelegate {
  _HeaderSliver({required this.bloc});

  final SliverScrollController bloc;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxHeaderExtent;
    if (percent > 0.1) {
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
          child: Container(
            height: _maxHeaderExtent,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      AnimatedOpacity(
                        opacity: percent < 0.1 ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: const Icon(Icons.arrow_back),
                      ),
                      AnimatedSlide(
                        duration: const Duration(milliseconds: 300),
                        offset: Offset(percent > 0.1 ? -0.18 : 0.1, 0),
                        curve: Curves.easeIn,
                        child:
                            H3(text: S.of(context).notificationSamplePlural(1)),
                      ),
                      /*IconButton(
                          onPressed: () {
                            print('saas');
                            print(bloc.scrollControllerGlobally);
                            print(bloc.scrollControllerGlobally.animateTo(1555,
                                duration: Duration(milliseconds: 600),
                                curve: Curves.easeInOut));
                          },
                          icon: Icon(Icons.add)),*/
                    ],
                  ),
                ),
                szv(5),
                Expanded(
                  child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: ListItemHeaderSliver(bloc: bloc)),
                )
              ],
            ),
          ),
        ),
        if (percent > 0.1)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: percent > 0.1
                  ? Container(
                      height: 0.5,
                      color: Colors.white10,
                    )
                  : null,
            ),
          )
      ],
    );
  }

  @override
  double get maxExtent => _maxHeaderExtent;

  @override
  double get minExtent => _maxHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
