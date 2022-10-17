import 'api_url.dart';
import 'net_util.dart';

class RestApi extends UrlAPI {
  NetworkUtil util = NetworkUtil();

  /*Future<dynamic> create({Map<String, dynamic>? body}) {
    return util
      .post(
    baseUrl + "/api/users",
    body:  body,
  )
  .then((value) {
    return value;
  });
  }*/

  Future<dynamic> createCity({Map<String, dynamic>? body}) {
    return util
        .postCity(
      baseUrl + "/city/add",
      body:  body,
    )
        .then((value) {
      return value;
    });
  }

  Future<dynamic> ListCities({Map<String, dynamic>? body}) {
    return util
        .getSearchCity(
      baseUrl + "/city/search",
      body: body,
    )
        .then((value) {
      return value;
    });
  }
}