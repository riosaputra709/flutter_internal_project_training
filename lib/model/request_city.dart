class RequestCityModel {
  String? city_code;
  String? city_name;
  String? created_by;
  String? created_date;
  String? changed_by;
  String? changed_date;

  RequestCityModel({this.city_code, this.city_name, this.created_by, this.created_date, this.changed_by, this.changed_date});

  RequestCityModel.map(Map<String, dynamic> obj) {
    city_code = obj['cityCode'];
    city_name = obj['cityName'];
    created_by = obj['createdBy'];
    created_date = obj['createdTime'];
    changed_by = obj['updateBy'];
    changed_date = obj['updateTime'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    data['cityCode'] = city_code;
    data['cityName'] = city_name;
    return data;
  }


}