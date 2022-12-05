import 'package:shared_preferences/shared_preferences.dart';

Future<SharedData> getdataShared(String key) async {
  final prefs = await SharedPreferences.getInstance();
  final dynamic data = prefs.getString(key);
  if (data == null) {
    return SharedData(data: null, exist: false);
  }
  return SharedData(data: data, exist: true);
}

Future<SharedData> setdataString(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  final dynamic data = prefs.setString(key, value);
  if (data == null) {
    return SharedData(data: null, exist: false);
  }
  return SharedData(data: data, exist: true);
}

class SharedData {
  final dynamic exist;
  final dynamic data;
  SharedData({this.exist, this.data});
}

Future addvalue() async {}
