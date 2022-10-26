import 'dart:io';
import 'dart:typed_data';

import 'api_url.dart';
import 'net_util.dart';

class RestApi extends UrlAPI {
  late List<int> _selectedFile;
  NetworkUtil util = NetworkUtil();

  Future<dynamic> createCity({Map<String, dynamic>? body}) {
    return util.postCity(baseUrl + "/city/add", body:  body,).then((value) {
      return value;
    });
  }

  Future<dynamic> uplCity(Uint8List body) {
    _selectedFile = body;
    return util.postUploadCity(baseUrl + "/city/upload", body:  _selectedFile,).then((value) {
      return value;
    });
  }

  Future<dynamic> editCity({Map<String, dynamic>? body}) {
    return util.putCity(baseUrl + "/city/edit", body:  body,).then((value) {
      return value;
    });
  }

  Future<dynamic> deleteCity(String city_code) {
    String param = "?cityCode="+city_code;
    return util.delete(baseUrl + "/city/delete", param).then((value) {
      return value;
    });
  }

  Future<dynamic> downloadCity({Map<String, dynamic>? body}) {
    return util.post(baseUrl + "/city/download", body:  body,).then((value) {
      return value;
    });
  }

  Future<dynamic> ListCities({Map<String, dynamic>? body}) {
    return util.post(baseUrl + "/city/search", body: body,).then((value) {
      return value;
    });
  }
}