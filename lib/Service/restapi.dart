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

  Future<dynamic> ListCities1(String city_code, String city_name, int page_number, int max_size) {
    return util
        .getSearchCity(
      baseUrl + "/city/search",
        city_code, city_name, page_number, max_size
    )
        .then((value) {
      return value;
    });
  }
}