import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:sfs_inversor/src/models/Loan_model.dart';
import 'package:sfs_inversor/src/models/notifictions_model.dart';

class MyHeader {
  const MyHeader({
    required this.visible,
    required this.index,
  });
  final int index;

  final bool visible;
}

class HeaderCard {
  const HeaderCard({
    required this.title,
    required this.path,
  });

  final String title;
  final String path;
}

final headercards = [
  HeaderCard(
      title: lorem(paragraphs: 1, words: 4),
      path: 'assets/icons/degradado/iconcalc.png'),
  HeaderCard(
      title: lorem(paragraphs: 1, words: 4),
      path: 'assets/icons/degradado/iconcheck.png'),
  HeaderCard(
      title: lorem(paragraphs: 1, words: 4),
      path: 'assets/icons/degradado/iconsend.png'),
  HeaderCard(
      title: lorem(paragraphs: 1, words: 4),
      path: 'assets/icons/degradado/iconsocio.png'),
  HeaderCard(
      title: lorem(paragraphs: 1, words: 4),
      path: 'assets/icons/degradado/iconlogo.png'),
];

class HomeScrollController {
  late BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  //List of products - Lista de productos
  late List<Loan> listInvest = loans;

  //list of offSet values - Lista de valores offSet de los item
  List<double> listOffSetItemHeader = [];
  late int listlenght = 0;
  var indexselect = ValueNotifier<int>(0);
  //Header notifier - Notificaciones de cabereca
  final headerNotifier = ValueNotifier<MyHeader?>(null);

  //Global Offset Value - Valor actual de scroll
  final globalOffsetValue = ValueNotifier<double>(0);

  //Indicador si estamos bajando o subiendo en el app
  //Indicator if we are going down or up in the application
  final goingDown = ValueNotifier<bool>(false);

  // Valor para hacer la validaciones de los iconos superiores
  final valueScroll = ValueNotifier<double>(0);

  // Para mover los items superiores en sliver - To move the top category bar
  late ScrollController scrollControllerItemHeader;

  // To have overall control of scrolling - To have overall control of scrolling
  late ScrollController scrollControllerGlobally;
  bool iss = false;
  // Valor que indica si el encabezado es visible
  // Value that indicates if the header is visible
  final visibleHeader = ValueNotifier(false);

  void init() {
    scrollControllerGlobally = ScrollController();
    scrollControllerItemHeader = ScrollController();
    indexselect.addListener(_listenToScrollChange);
    visibleHeader.addListener(_listenVisibleHeader);
    visibleHeader.addListener(() => iss = visibleHeader.value);
    indexselect.addListener(_listenHeaderNotifier);
  }

  void _listenVisibleHeader() {
    if (visibleHeader.value) {
      headerNotifier.value = const MyHeader(visible: false, index: 0);
    }
  }

  void _listenHeaderNotifier() {
    print('ha cambiado el index');
    for (var i = 0; i < listlenght; i++) {
      scrollAnimationHorizontal(index: i);
    }
    if (visibleHeader.value) {
      for (var i = 0; i < listlenght; i++) {
        scrollAnimationHorizontal(index: i);
      }
    }
  }

  void dispose() {
    scrollControllerItemHeader.dispose();
    scrollControllerGlobally.dispose();
  }

  void _listenToScrollChange() {
    globalOffsetValue.value = scrollControllerGlobally.offset;
    if (scrollControllerGlobally.position.userScrollDirection ==
        ScrollDirection.reverse) {
      goingDown.value = true;
    } else {
      goingDown.value = false;
    }
  }

  void scrollAnimationHorizontal({required int index}) {
    /*scrollControllerItemHeader.animateTo(
      listOffSetItemHeader[2] - 16,
      duration: const Duration(milliseconds: 500),
      curve: goingDown.value ? Curves.bounceOut : Curves.fastOutSlowIn,
    );*/
    if (headerNotifier.value?.index == index && headerNotifier.value!.visible) {
      scrollControllerItemHeader.animateTo(
        listOffSetItemHeader[headerNotifier.value!.index] - 16,
        duration: const Duration(milliseconds: 500),
        curve: goingDown.value ? Curves.bounceOut : Curves.fastOutSlowIn,
      );
    }
  }

  void refreshHeader(
    int index,
    bool visible, {
    int? lastIndex,
  }) {
    final headerValue = headerNotifier.value;
    final headerTitle = headerValue?.index ?? index;
    final headerVisible = headerValue?.visible ?? false;

    if (headerTitle != index || lastIndex != null || headerVisible != visible) {
      Future.microtask(
        () {
          if (!visible && lastIndex != null) {
            headerNotifier.value = MyHeader(
              visible: true,
              index: lastIndex,
            );
          } else {
            headerNotifier.value = MyHeader(
              visible: visible,
              index: index,
            );
          }
        },
      );
    }
  }
}
