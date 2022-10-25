import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../helper/app_exception.dart';

class NetworkUtil {
  static NetworkUtil instance = NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => instance;

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

  Future<dynamic> postCity(
      String url, {
        Map<String, dynamic>? body,
        Map<String, String>? headers,
        encoding,
      }) async {
    String jsonBody = jsonEncode(body);
    List<String> listBody = [];
    listBody.add(jsonBody);
    Map<String, String> headerJson = {
      "Accept": "*/*",
      "Content-Type": "application/json",
    };
    if(headers != null) {
      headerJson.addAll(headers);
    }
    return await http
        .post(Uri.parse(url), headers: headerJson, body: listBody.toString(), encoding: encoding)
        .then((http.Response response) => _returnResponse(response));
  }

  Future<dynamic> postUploadCity(
      String url, {
        String? body,
        Map<String, String>? header,
        encoding,
      }) async {
    Map<String, String> headerJson = {
      "Accept": "*/*",
      //"Content-Type": "multipart/form-data",
    };
    if(header != null) {
      headerJson.addAll(header);
    }
    Map<String, File> bodyFileJson = {
      "file": File(body!),
    };

    return await http
        .post(Uri.parse(url), headers: headerJson, body: bodyFileJson, encoding: encoding)
        .then((http.Response response) => _returnResponse(response));
  }

  Future<dynamic> putCity(
      String url, {
        Map<String, dynamic>? body,
        Map<String, String>? headers,
        encoding,
      }) async {
    String jsonBody = jsonEncode(body);
    List<String> listBody = [];
    listBody.add(jsonBody);
    Map<String, String> headerJson = {
      "Accept": "*/*",
      "Content-Type": "application/json",
    };
    if(headers != null) {
      headerJson.addAll(headers);
    }
    return await http
        .put(Uri.parse(url), headers: headerJson, body: listBody.toString(), encoding: encoding)
        .then((http.Response response) => _returnResponse(response));
  }

  Future<dynamic> post(
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


  Future<dynamic> delete(String url, String param) {
    final JsonDecoder _decoder = new JsonDecoder();
    return http.delete(Uri.parse(url+param)).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

}