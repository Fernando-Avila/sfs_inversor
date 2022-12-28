import 'package:flutter/material.dart';
import 'package:sfs_inversor/generated/l10n.dart';
import 'package:sfs_inversor/src/device/sharedpreferences.dart';
import 'package:sfs_inversor/src/global/routes.dart';
import 'package:sfs_inversor/src/widgets/exportwidgets.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> with TickerProviderStateMixin {
  final PageController Pagecontroller = PageController();
  int pageposition = 0;
  bool firstpage = true;
  bool latestpage = false;
  var txt = lorem(paragraphs: 2, words: 8);
  var txt1 = lorem(paragraphs: 2, words: 8);
  var txt3 = lorem(paragraphs: 2, words: 8);
  var txt2 = lorem(paragraphs: 2, words: 8);
  late final AnimationController _controllerpage = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
      reverseDuration: const Duration(seconds: 3));
  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
      lowerBound: 0.95,
      reverseDuration: const Duration(seconds: 3))
    ..repeat(reverse: true);
  late final AnimationController _controllerb = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
      lowerBound: 0.5,
      reverseDuration: const Duration(seconds: 3))
    ..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _controllerb.dispose();
    _controllerpage.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: H2(
            text: S.of(context).welcome,
            color: EstiloApp.colorwhite,
          ),
          centerTitle: true),
      body: body(),
    );
  }

  Widget body() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: EstiloApp.primaryblue),
          height: 250,
        ),
        PageView(
          onPageChanged: (value) => _Pageposition(value),
          controller: Pagecontroller,
          children: [
            Cardanimated(pos: 0, pagepos: pageposition, child: card()),
            Cardanimated(pos: 1, pagepos: pageposition, child: card1()),
            Cardanimated(pos: 2, pagepos: pageposition, child: card2()),
            Cardanimated(pos: 3, pagepos: pageposition, child: card3()),
            Cardanimated(pos: 4, pagepos: pageposition, child: cardlogin()),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 100,
          child: MoveIntro(),
        ),
        AnimatedPositioned(
            curve: Curves.fastOutSlowIn,
            left: firstpage ? MediaQuery.of(context).size.width / 2 : 0,
            top: MediaQuery.of(context).size.height / (firstpage ? 1 : 2.5),
            duration: const Duration(seconds: 1),
            child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _controllerb.value,
                    child: IconButton(
                      alignment: Alignment.centerLeft,
                      onPressed: () => Pagecontroller.previousPage(
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeIn),
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: _controller.value * 50,
                      ),
                    ),
                  );
                })),
        AnimatedPositioned(
            curve: Curves.fastOutSlowIn,
            right: latestpage ? MediaQuery.of(context).size.width / 2 : 0,
            top: MediaQuery.of(context).size.height / (latestpage ? 1 : 2.5),
            duration: const Duration(seconds: 1),
            child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _controllerb.value,
                    child: IconButton(
                      alignment: Alignment.centerRight,
                      onPressed: () => Pagecontroller.nextPage(
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.ease),
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: _controller.value * 50,
                      ),
                    ),
                  );
                })),
      ],
    );
  }

  Widget card() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 110),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset(
                'assets/icons/degradado/iconlogo.png',
              ),
              t1(text: txt, fontWeight: FontWeight.w600),
            ],
          ),
        ),
      ),
    );
  }

  Widget card3() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 110),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset(
                'assets/icons/degradado/iconinversionista.png',
                width: 250,
              ),
              t1(text: txt1, fontWeight: FontWeight.w600),
            ],
          ),
        ),
      ),
    );
  }

  Widget card1() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 110),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset(
                'assets/icons/degradado/iconsend.png',
                width: 250,
              ),
              t1(text: txt2, fontWeight: FontWeight.w600),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardlogin() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 110),
      child: Card(
          child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/img/handshaking.jpg',
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  gradient: EstiloApp.verticalgradientwhite),
            ),
          ),
          Center(
            child: Column(
              //   crossAxisAlignment: WrapCrossAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              // alignment: WrapAlignment.center,
              //  spacing: 20,
              //  runSpacing: 10,
              //runAlignment: WrapAlignment.center,
              children: [
                H2(
                  text: 'Lorem Ipsum',
                  // color: EstiloApp.colorwhite,
                  fontWeight: FontWeight.bold,
                  color: EstiloApp.primaryblue,
                ),
                szv(5),
                BtnDegraded(
                  width: 0.55,
                  widget: H3(
                    text: 'Lorem Ipsum',
                    color: EstiloApp.colorwhite,
                  ),
                ),
                szv(5),
                H2(
                  text: 'Lorem Ipsum',
                  //color: EstiloApp.colorwhite,
                  fontWeight: FontWeight.bold,
                  color: EstiloApp.primaryblue,
                ),
                szv(20),
                BtnBlue(
                  metod: () async {
                    await setdataString('appinstalled', 'installed');
                    Navigator.pushAndRemoveUntil(
                        context,
                        Routes().Push(Routes().login, AnimatedPage.fade, 800),
                        (route) => false);
                  },
                  widget: H3(
                    text: S.of(context).login.toUpperCase(),
                    color: EstiloApp.colorwhite,
                  ),
                  width: 0.55,
                ),
                szv(20),
                BtnDegraded(
                  width: 0.55,
                  metod: () async {
                    await setdataString('appinstalled', 'installed');

                    Navigator.push(
                        context,
                        Routes()
                            .Push(Routes().register, AnimatedPage.fade, 800));
                  },
                  widget: H3(
                    text: S.of(context).signup.toUpperCase(),
                    color: EstiloApp.colorwhite,
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget card2() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 110),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset(
                'assets/icons/degradado/iconsolicitud.png',
                width: 250,
              ),
              t1(text: txt3, fontWeight: FontWeight.w600),
            ],
          ),
        ),
      ),
    );
  }

  _Pageposition(int value) {
    if (value == 0) {
      firstpage = true;
    } else {
      firstpage = false;
    }
    if (value == 4) {
      latestpage = true;
    } else {
      latestpage = false;
    }
    pageposition = value;
    setState(() {});
  }

  Widget MoveIntro() {
    return Container(
        decoration: BoxDecoration(
            boxShadow: kElevationToShadow[6],
            color: EstiloApp.colorwhite,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 40,
                width: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return index == pageposition
                        ? Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: EstiloApp.primarypurple,
                              shape: BoxShape.circle,
                            ),
                          )
                        : Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: EstiloApp.primarypink,
                              shape: BoxShape.circle,
                            ),
                            child: InkWell(
                              onTap: () => Pagecontroller.animateToPage(index,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeIn),
                            ),
                          );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AnimatedOpacity(
                    opacity: latestpage ? 0.0 : 1.0,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeIn,
                    child: TextButton(
                      onPressed: () {
                        Pagecontroller.nextPage(
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.easeIn);
                      },
                      child: H3(
                        text: S.of(context).next,
                        color: EstiloApp.primaryblue,
                      ),
                    ),
                  ),
                  AnimatedCrossFade(
                      firstChild: TextButton(
                          onPressed: () => Pagecontroller.animateToPage(4,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeIn),
                          child: H3(
                            text: S.of(context).skip,
                            color: EstiloApp.primaryblue,
                          )),
                      secondChild: TextButton(
                          onPressed: () async {
                            await setdataString('appinstalled', 'installed');

                            Navigator.pushAndRemoveUntil(
                                context,
                                Routes().Push(Routes().home,
                                    AnimatedPage.sliderightfade, 400),
                                (route) => false);
                          },
                          child: H3(
                            text: S.of(context).continu,
                            color: EstiloApp.primaryblue,
                          )),
                      crossFadeState: latestpage
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: Duration(seconds: 1)),
                ],
              ),
            ),
          ],
        ));
  }
}
