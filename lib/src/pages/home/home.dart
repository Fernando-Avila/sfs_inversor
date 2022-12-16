import 'package:flutter/material.dart';
import 'package:sfs_inversor/generated/l10n.dart';
import 'package:sfs_inversor/src/controller/home/home_controller.dart';
import 'package:sfs_inversor/src/controller/notification_controller.dart';
import 'package:sfs_inversor/src/pages/home/ui/sliver_body_items.dart';
import 'package:sfs_inversor/src/pages/notifycation/ui/list_item_header_sliver.dart';
import 'package:sfs_inversor/src/pages/notifycation/ui/sliver_body_items.dart';

import 'package:sfs_inversor/src/styles/custom_styles.dart';
import 'package:sfs_inversor/src/widgets/layouts/actionNotification.dart';
import 'package:sfs_inversor/src/widgets/layouts/drawer.dart';
import 'package:sfs_inversor/src/widgets/layouts/extras.dart';
import 'package:sfs_inversor/src/widgets/widgettext.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

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
        drawer: DrawerC(),
      ),
    );
    /*return Scaffold(
      appBar: AppBar(
        actions: const [
          ActionNotification(),
        ],
      ),
      body: body(),
      drawer: DrawerC(),
    );*/
  }

  Widget body() {
    return PageView(
      children: [],
    );
  }

  /*
  Widget home() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Stack(children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'asset/img/handshaking.jpg',
                ),
              ),
            ),
            height: height,
          ),
          Container(
            height: height,
            decoration: const BoxDecoration(
                color: Colors.white, gradient: EstiloApp.verticalgradientwhite),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textH1l('EL FINANCIAMIENTO', EstiloApp.primaryblue,
                    FontWeight.bold),
                Container(
                  decoration: BoxDecoration(
                      gradient: EstiloApp.horizontalgradientpurplepink,
                      borderRadius: BorderRadius.circular(60)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textH2('QUE BUSCAS CON ', EstiloApp.colorwhite,
                          FontWeight.normal),
                      textH2('LOS MEJORES RESULTADOS', EstiloApp.colorwhite,
                          FontWeight.bold),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/login'),
                  child: textH1l('¡CONOCE MAS AHORA!', EstiloApp.primaryblue,
                      FontWeight.bold),
                ),
                SizedBox(height: height * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: button(
                          'SOLICITAR', EstiloApp.horizontalgradientblue, 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: button('INVERTIR',
                          EstiloApp.horizontalgradientpurplepink, 2),
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            color: EstiloApp.colorwhite,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                /*s  LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    if (constraints.maxWidth < 800) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'asset/icons/degradado/iconlogo.png',
                            width: 70,
                          ),
                          const Text('SFS',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: EstiloApp.primaryblue,
                                  fontSize: 52,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold))
                        ],
                      );
                    } else {
                      return Image.asset(
                        'asset/icons/degradado/iconlogo.png',
                        width: 70,
                      );
                    }
                  },
                ),*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    btn(
                        textp2('INICIO', EstiloApp.colorwhite,
                            FontWeight.normal),
                        EstiloApp.horizontalgradientpurplepink,
                        1),
                    btn(
                        textp2('CONOCENOS', EstiloApp.primaryblue,
                            FontWeight.normal),
                        EstiloApp.verticalgradientwhite,
                        1),
                    btn(
                        textp2('SOLICITAR', EstiloApp.primaryblue,
                            FontWeight.normal),
                        EstiloApp.verticalgradientwhite,
                        1),
                    btn(
                        textp2('INVERTIR', EstiloApp.primaryblue,
                            FontWeight.normal),
                        EstiloApp.verticalgradientwhite,
                        1),
                    btn(
                        textp2('PREGUNTAS', EstiloApp.primaryblue,
                            FontWeight.normal),
                        EstiloApp.verticalgradientwhite,
                        1),
                    btn(
                        textp2('CREAR CUENTA', EstiloApp.colorwhite,
                            FontWeight.normal),
                        EstiloApp.horizontalgradientpurplepink,
                        1)
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget calculadora() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration:
          BoxDecoration(gradient: EstiloApp.horizontalgradientpurplepink),
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          textH1l(
              'EMPIEZA AHORA MISMO', EstiloApp.colorwhite, FontWeight.normal),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button(
                  'CREAR UNA CUENTA',
                  LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment(0.0, 1.0),
                    colors: <Color>[
                      EstiloApp.colorwhite,
                      EstiloApp.colorwhite,
                    ],
                  ),
                  1),
              button('INICIAR SESIÓN', EstiloApp.horizontalgradientblue, 2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pasos(),
              calculadorslider(),
            ],
          ),
        ],
      ),
    );
  }

  Widget btn(Widget text, LinearGradient gradient, int op) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          onTap: () {
            print(op);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), gradient: gradient),
            child: text,
          )),
    );
  }

  Widget inkwell(String title, String img, int op) {
    return Container(
      width: 200,
      height: 180,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            //   color: Colors.grey.withOpacity(0.5),
            color: Colors.grey,
            spreadRadius: 7,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
          splashColor: EstiloApp.primarypurple,
          onTap: () => chargescreen(context),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.asset(
                  img,
                ),
              ),
              text(title, 10),
            ],
          )),
    );
  }

  Widget button(String title, LinearGradient gradient, int op) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        splashColor: Colors.grey,
        onTap: () => op == 1
            ? Navigator.pushNamed(context, '/comofunciona_page')
            : Navigator.pushNamed(context, '/oportunidades_page'),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 50),
          decoration: BoxDecoration(
              gradient: gradient, borderRadius: BorderRadius.circular(60)),
          child: textH1(title, EstiloApp.colorwhite, FontWeight.normal),
        ),
      ),
    );
  }

  Widget calculadorslider() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        //width: MediaQuery.of(context).size.width * 0.35,
        constraints:
            BoxConstraints(maxWidth: 450, maxHeight: 500, minWidth: 200),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
            color: EstiloApp.colorwhite,
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textp2(
                        'Capital:', EstiloApp.primaryblue, FontWeight.normal),
                    text('US \$$_capital', 5)
                  ],
                ),
                SfSlider(
                  min: 0.0,
                  max: 5000,
                  value: _capital,
                  activeColor: EstiloApp.primaryblue,
                  stepSize: 500,
                  interval: 1000,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  showDividers: true,
                  minorTicksPerInterval: 1,
                  labelFormatterCallback:
                      (dynamic actualValue, String formattedText) {
                    return '\$$formattedText';
                  },
                  onChanged: (dynamic value) {
                    setState(() {
                      _capital = value;
                      _total = calcularvalores(_capital, _plazo, _interes);
                    });
                  },
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textp2('Plazo:', EstiloApp.primaryblue, FontWeight.normal),
                    text('$_plazo meses', 10)
                  ],
                ),
                SfSlider(
                  min: 3,
                  max: 24,
                  value: _plazo,
                  activeColor: EstiloApp.primaryblue,
                  stepSize: 3,
                  interval: 3,
                  showTicks: true,
                  showLabels: true,
                  showDividers: true,
                  onChanged: (dynamic value) {
                    setState(() {
                      _plazo = value;
                      _total = calcularvalores(_capital, _plazo, _interes);
                    });
                  },
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textp2('Tasa de Interes:', EstiloApp.primaryblue,
                        FontWeight.normal),
                    text('$_interes% Anual', 5)
                  ],
                ),
                SfSlider(
                  min: 14,
                  max: 30,
                  value: _interes,
                  activeColor: EstiloApp.primaryblue,
                  stepSize: 2,
                  interval: 2,
                  showTicks: true,
                  showLabels: true,
                  showDividers: true,
                  labelFormatterCallback:
                      (dynamic actualValue, String formattedText) {
                    return '$formattedText%';
                  },
                  onChanged: (dynamic value) {
                    setState(() {
                      _interes = value;
                      _total = calcularvalores(_capital, _plazo, _interes);
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                    color: EstiloApp.primaryblue,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: <Widget>[
                        textp4('CUOTA MENSUAL:', EstiloApp.colorwhite,
                            FontWeight.normal),
                        textH3('US\$${(_total).toStringAsFixed(2)}',
                            EstiloApp.colorwhite, FontWeight.normal),
                      ],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: EstiloApp.primarypink,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                          shadowColor: EstiloApp.primarypurple,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        onPressed: () => chargescreen(context),
                        child: textp2('SOLICITAR', EstiloApp.colorwhite,
                            FontWeight.normal))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget pasos() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        constraints:
            BoxConstraints(maxWidth: 450, maxHeight: 500, minWidth: 200),
        //  width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: EstiloApp.primaryblue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            inf('asset/icons/blancos/iconcalc.png', '1.Calcula tu cuota'),
            inf('asset/icons/blancos/iconsolicitud.png',
                '2.Llena la solicitud'),
            inf('asset/icons/blancos/iconsend.png',
                '3.Envía tu informacion financiera'),
            inf('asset/icons/blancos/iconcheck.png',
                '4.Acepta las condiciones de financiamiento'),
          ],
        ),
      ),
    );
  }

  Widget inf2(String img, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            img,
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Container(
              alignment: Alignment.centerLeft,
              constraints: BoxConstraints(maxWidth: 300),
              child: textH3(title, EstiloApp.colorwhite, FontWeight.normal))
        ],
      ),
    );
  }

  Widget inf(String img, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Container(
            alignment: Alignment.centerLeft,
            constraints: BoxConstraints(maxWidth: 300),
            child: textH3(title, EstiloApp.colorwhite, FontWeight.normal)),
        leading: Image.asset(
          img,
          width: MediaQuery.of(context).size.width * 0.05,
        ),
      ),
    );
  }
*/
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
                  //height: 120.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                ),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () => print('text $i'),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: EstiloApp.colorwhite,
                                borderRadius: BorderRadius.circular(9),
                                boxShadow: kElevationToShadow[4]),
                            child: Text(
                              'text $i',
                              style: TextStyle(fontSize: 16.0),
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
                  onPressed: () => drawercontrol(), icon: Icon(Icons.menu)),
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
                          child: IconButton(
                              onPressed: () => drawercontrol(),
                              icon: Icon(Icons.menu)),
                        ),
                        AnimatedCrossFade(
                            firstCurve: Curves.easeInOut,
                            secondCurve: Curves.easeInOut,
                            sizeCurve: Curves.easeInOut,
                            reverseDuration: Duration(milliseconds: 300),
                            firstChild: H3(
                                color: EstiloApp.colorwhite,
                                text:
                                    S.of(context).notificationSamplePlural(1)),
                            secondChild: H3(
                                color: EstiloApp.colorwhite,
                                text: 'Mas inversiones'),
                            crossFadeState: percent > 0.01
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: Duration(milliseconds: 300)),
                        AnimatedOpacity(
                          opacity: percent > 0.01 ? 1 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: ActionNotification(),
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
                  child: _listages(bloc: bloc),
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

class _listages extends StatelessWidget {
  const _listages({Key? key, required this.bloc}) : super(key: key);
  final HomeScrollController bloc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
            IconButton(
                onPressed: () {
                  print('sss');
                },
                icon: Icon(Icons.first_page)),
            IconButton(
                onPressed: () {
                  print('sss');
                },
                icon: Icon(Icons.arrow_back_ios_new_outlined)),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    20,
                    (index) {
                      return Container(
                        margin: const EdgeInsets.only(
                          top: 8,
                          bottom: 8,
                          right: 8,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: index == 1 ? Colors.white : null,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          index.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: index == 1 ? Colors.black : Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  print('sss');
                },
                icon: Icon(Icons.last_page)),
            IconButton(
                onPressed: () {
                  print('sss');
                },
                icon: Icon(Icons.arrow_forward_ios_outlined)),
          ])),
    );
  }
}
