import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sfs_inversor/src/models/investment_model.dart';

class MyHeader {
  const MyHeader({
    required this.visible,
    required this.index,
  });
  final int index;

  final bool visible;
}


class AccountController {
  late BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  //List of products - Lista de productos
  late List<Investment> listInvestment = investments;

  //list of offSet values - Lista de valores offSet de los item
  List<double> listOffSetItemHeader = [];

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
    scrollControllerGlobally.addListener(_listenToScrollChange);
    visibleHeader.addListener(_listenVisibleHeader);
    visibleHeader.addListener(() => iss = visibleHeader.value);
  }

  void _listenVisibleHeader() {
    if (visibleHeader.value) {
      headerNotifier.value = const MyHeader(visible: false, index: 0);
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
}
