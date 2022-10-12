class CityModel {
  String? city_code;
  String? city_name;
  String? created_by;
  String? created_date;
  String? changed_by;
  String? changed_date;

  CityModel({this.city_code, this.city_name, this.created_by, this.created_date, this.changed_by, this.changed_date});

  CityModel.map(Map<String, dynamic> obj) {
    city_code = obj['cityCode'];
    city_name = obj['cityName'];
    created_by = obj['createdBy'];
    created_date = obj['createdTime'];
    changed_by = obj['updateBy'];
    changed_date = obj['updateTime'];
  }


}