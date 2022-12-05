import 'package:http/http.dart' as http;
import 'package:sfs_inversor/src/global/environment.dart';

class Services {
  Future<dynamic> httpGet(String path, header) async {
    var url = Uri.parse(Enviroment.apiUrl + path);
    return await http.get(url, headers: header).then((value) async {
      return value;
    });
  }

  Future<dynamic> httpPost(String path, header, body) async {
    var url = Uri.parse(Enviroment.apiUrl + path);
    return await http
        .post(url, headers: header, body: body)
        .then((value) async {
      return value;
    });
  }

  Future<dynamic> httpPut(String path, header, body) async {
    var url = Uri.parse(Enviroment.apiUrl + path);
    return await http.put(url, headers: header, body: body).then((value) async {
      return value;
    });
  }

  Future<dynamic> httpDelete(String path,  int id) async {
    var url = Uri.parse(Enviroment.apiUrl + path);
    var header = {
    'content-type': 'application/json',
    'accept': 'application/json',
    "connection": "Keep-Alive",
  };
    return await http.delete(url, headers: header).then((value) async {
      return value;
    });
  }

  Future<dynamic> httpPostRequest(request) async {
    //var request =
    //http.MultipartRequest("POST", Uri.parse(Enviroment.apiUrl + path));
    var response = await request.send();
    return await http.Response.fromStream(response);
  }

  Future<dynamic> httpGetList(String path, header) async {
    var url = Uri.parse(Enviroment.apiUrl + path);
    http.get(url, headers: header).then((value) async {
      return value;
    });
  }
}
