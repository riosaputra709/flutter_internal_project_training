class CityModelRequest {
  String? page_size;
  String? page_no;
  String? city_code;
  String? city_name;

  CityModelRequest({this.page_size, this.page_no, this.city_code, this.city_name});

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    data['pageSize'] = page_size==null? '' : page_size.toString();
    data['pageNo'] = page_no==null? '' : page_no.toString();
    data['cityCode'] = city_code==null? '' : city_code.toString();
    data['cityName'] = city_name==null? '' : city_name.toString();
    return data;
  }

  Map<String, dynamic> toMapCreateCity() {
    final Map<String, dynamic> data = {};
    data['cityCode'] = city_code==null? '' : city_code.toString();
    data['cityName'] = city_name==null? '' : city_name.toString();
    return data;
  }


}