import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helper/app_exception.dart';

class NetworkUtil {
  static NetworkUtil instance = NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => instance;

  Future<dynamic> postCity(
    String url, {
      Map<String, dynamic>? body,
      Map<String, String>? headers,
      encoding,
    }) async {
    String jsonBody = jsonEncode(body);
    Map<String, String> headerJson = {
      "Accept": "*/*",
      "Content-Type": "application/json",
    };
    if(headers != null) {
      headerJson.addAll(headers);
    }
    return await http
        .post(Uri.parse(url), headers: headerJson, body: jsonBody, encoding: encoding)
        .then((http.Response response) => _returnResponse(response));
    }

    dynamic _returnResponse(http.Response response) {
      switch (response.statusCode) {
        case 200:
          dynamic responseJson;
          if(response.body.isNotEmpty) {
            responseJson = jsonDecode(response.body.toString());
          } else {
            responseJson = response.body;
          }
          return responseJson;
        case 201:
          dynamic responseJson;
          if(response.body.isNotEmpty) {
            responseJson = jsonDecode(response.body.toString());
          } else {
            responseJson = response.body;
          }
          return responseJson;
        case 400:
          var responseJson = jsonDecode(response.body.toString());
          throw BadRequestExeption(responseJson['message']);
        case 500:
          var responseJson = jsonDecode(response.body.toString());
          throw FetchDataException(responseJson['message']);
        default:
          throw FetchDataException(
            'error occured while communication with server with statuscode: '
            + response.statusCode.toString(),
          );
      }
    }

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> getSearchCity(String url, String cityCode, String cityName, int pageNumber, int maxSize ) {
    String _cityCode = '', _cityName = '';
    if(cityCode.isNotEmpty){
      _cityCode = '&cityCode='+cityCode;
    }
    if(cityName.isNotEmpty){
      _cityName = '&cityName='+cityName;
    }
    return http.get(Uri.parse(url+'?pageNumber='+pageNumber.toString()+'&maxSize='+maxSize.toString()+_cityCode+_cityName
    )).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }
}