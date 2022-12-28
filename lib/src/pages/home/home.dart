import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfs_inversor/generated/l10n.dart';
import 'package:sfs_inversor/src/bloc/loan/loan_bloc.dart';
import 'package:sfs_inversor/src/controller/home/home_controller.dart';
import 'package:sfs_inversor/src/pages/home/ui/sliver_body_items.dart';
import 'package:sfs_inversor/src/pages/notifycation/ui/get_box_offset.dart';
import 'package:sfs_inversor/src/widgets/exportwidgets.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  static String id = '/home_page';
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final bloc = HomeScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    bloc.init();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    drawerController.toggle!(forceToggle: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc.context = context;
    return ZoomDrawerZ(
      drawerController: drawerController,
      child: Scaffold(
        key: bloc.scaffoldKey,
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
                      SliverBodyItemsInversor(
                        listItem: bloc.listInvest,
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

  Widget body() {
    return PageView(
      children: [],
    );
  }
}

const _maxHeaderExtent = 100.0;

class _FlexibleSpaceBarHeader extends StatelessWidget {
  const _FlexibleSpaceBarHeader({
    Key? key,
    required this.valueScroll,
    required this.bloc,
  }) : super(key: key);

  final double valueScroll;
  final HomeScrollController bloc;

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      stretch: true,
      expandedHeight: 140,
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
              padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
              color: EstiloApp.primaryblue,
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlayCurve: Curves.easeInOut,
                  //height: 120.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                ),
                items: headercards.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () => print('text $i'),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: EstiloApp.colorwhite,
                                borderRadius: BorderRadius.circular(9),
                                boxShadow: kElevationToShadow[4]),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      image: DecorationImage(
                                        image: AssetImage(i.path),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        t3(text: i.title),
                                        const SizedBox(height: 5),
                                        l2(text: i.title),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Positioned(
              right: 10,
              top: (sizeHeight + 25) - bloc.valueScroll.value,
              child: ActionNotification(),
            ),
            Positioned(
              left: 10,
              top: (sizeHeight + 25) - bloc.valueScroll.value,
              child: IconButton(
                  onPressed: () => drawercontrol(drawerController),
                  icon: Icon(Icons.menu)),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderSliver extends SliverPersistentHeaderDelegate {
  _HeaderSliver({required this.bloc});
  final HomeScrollController bloc;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxHeaderExtent;
    if (percent > 0.0) {
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
            onTap: () => print(bloc.iss),
            child: Container(
              height: _maxHeaderExtent,
              color: EstiloApp.primaryblue,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  szv(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedOpacity(
                          opacity: percent > 0.1 ? 1 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: AnimatedSlide(
                            duration: const Duration(milliseconds: 300),
                            offset: Offset(0.0, percent > 0.01 ? -0.1 : -1.2),
                            curve: Curves.easeIn,
                            child: IconButton(
                                onPressed: () =>
                                    drawercontrol(drawerController),
                                icon: Icon(Icons.menu)),
                          ),
                        ),
                        AnimatedCrossFade(
                            firstCurve: Curves.easeInOut,
                            secondCurve: Curves.easeInOut,
                            sizeCurve: Curves.easeInOut,
                            reverseDuration: Duration(milliseconds: 300),
                            firstChild: t3(
                                color: EstiloApp.colorwhite,
                                text: 'Oportunidades de inversion.'),
                            secondChild: t2(
                                color: EstiloApp.colorwhite,
                                text: 'Oportunidades de inversion.'),
                            crossFadeState: percent > 0.01
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: Duration(milliseconds: 300)),
                        AnimatedOpacity(
                          opacity: percent > 0.01 ? 1 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: AnimatedSlide(
                              duration: const Duration(milliseconds: 300),
                              offset: Offset(0.0, percent > 0.01 ? -0.1 : -1.2),
                              curve: Curves.easeIn,
                              child: ActionNotification()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 40,
              child: AnimatedOpacity(
                opacity: percent > 0.1 ? 1 : 0,
                duration: const Duration(milliseconds: 400),
                child: AnimatedSlide(
                  duration: const Duration(milliseconds: 300),
                  offset: Offset(0.0, percent > 0.01 ? -0.1 : -1.2),
                  curve: Curves.easeIn,
                  child: _Listages(bloc: bloc),
                ),
              ),
            ))
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

class _Listages extends StatelessWidget {
  const _Listages({Key? key, required this.bloc}) : super(key: key);
  final HomeScrollController bloc;

  @override
  Widget build(BuildContext context) {
    var loanBloc = context.read<LoanBloc>();

    return BlocBuilder<LoanBloc, LoanState>(
      builder: (context, state) {
        bloc.listlenght = state.loanlistlength!;
        bloc.indexselect.value = state.pageindex!;
        var ftemsOffset =
            List.generate(state.loanlistlength!, (index) => index.toDouble());
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                    onPressed: () =>
                        loanBloc.add(LoanChangeIndexEvent(pageindex: 0)),
                    icon: Icon(Icons.first_page)),
                IconButton(
                    onPressed: () => loanBloc.add(
                        LoanChangeIndexEvent(pageindex: state.pageindex! - 1)),
                    icon: Icon(Icons.arrow_back_ios_new_outlined)),
                Expanded(
                  child: SingleChildScrollView(
                    controller: bloc.scrollControllerItemHeader,
                    scrollDirection: Axis.horizontal,
                    child: ValueListenableBuilder(
                        valueListenable: bloc.headerNotifier,
                        builder: (context, MyHeader? snapshot, _) {
                          return Row(
                            children: List.generate(
                              state.loanlistlength!,
                              (index) {
                                return GetBoxOffset(
                                  offset: (offSet) {
                                    return ftemsOffset[index] = offSet.dx;
                                  },
                                  child: InkWell(
                                    onTap: () => loanBloc.add(
                                        LoanChangeIndexEvent(pageindex: index)),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        top: 8,
                                        bottom: 8,
                                        right: 8,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: index == state.pageindex
                                            ? Colors.white
                                            : null,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Text(
                                        '${index + 1}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: index == state.pageindex
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }),
                  ),
                ),
                IconButton(
                    onPressed: () => loanBloc.add(
                        LoanChangeIndexEvent(pageindex: state.pageindex! + 1)),
                    icon: Icon(Icons.arrow_forward_ios_outlined)),
                IconButton(
                    onPressed: () => loanBloc.add(LoanChangeIndexEvent(
                        pageindex: state.loanlistlength! - 1)),
                    icon: Icon(Icons.last_page)),
              ]),
        );
      },
    );
  }
}
