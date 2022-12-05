import 'package:flutter/widgets.dart';
import 'package:sfs_inversor/src/pages/notifycation/notification.dart';

class NotificationController {
  late List<Notifications> listNotification;
  List<double> listOffSetItemHeader = [];
  //final hederNotifier = ValueNotifier();

  final globalOffsetValue = ValueNotifier<double>(0);
  final goingDown = ValueNotifier<bool>(false);

  final valueScroll = ValueNotifier<double>(0);

  late ScrollController scrollControllerItemHeader;

   late ScrollController scrollControllerGlobalty;

  late BuildContext context;
  List Categorias = ['Importantes', 'Recientes', 'Revisadas', 'Papelera', ''];
  void init() {
    //ListOffSetItemHeader =
    //  List.generate(Categorias.length, (index) => index.toDouble());
    scrollControllerGlobalty = ScrollController(initialScrollOffset: 40.0);
    scrollControllerItemHeader = ScrollController();
    scrollControllerGlobalty.addListener(() {
      globalOffsetValue.value = scrollControllerGlobalty.offset;
    });
  }

  void _listeToScrollChange() {
    globalOffsetValue.value = scrollControllerGlobalty.offset;
  }
}
