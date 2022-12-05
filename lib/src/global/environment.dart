import 'dart:io' show Platform;

import 'package:sfs_inversor/src/pages/auth/termsandconditions.dart';

class Enviroment {
  static String apiUrl = 'http://192.168.1.51:8000/';
  String apigoogle = 'AIzaSyAdtacnR0FmXvBzATNFczLuIuLLd6V9yg0';
  static String keymessaging =
      'BMnEDleIV0mKcGKgK0jefQc7dnWrbG37E7doeKxc0CoqcmwWuRd6Z6N4rVgmfpUpRV03lourUlAePngHepL_Ric';
  final String termsandconditionslink = 'https://ecuadom.com/';
  static String? contact(String Contacto) {
    if (Platform.isAndroid) {
      return 'whatsapp://send?phone=$Contacto';
    } else if (Platform.isIOS) {
      return 'https://wa.me/$Contacto';
    }
  }

  static var header = {
    'content-type': 'application/json',
    'accept': 'application/json',
    "connection": "Keep-Alive",
  };
}
