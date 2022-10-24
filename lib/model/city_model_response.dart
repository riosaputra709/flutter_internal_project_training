class CityModelResponse {
  String? city_code;
  String? city_name;
  String? created_by;
  String? created_date;
  String? changed_by;
  String? changed_date;

  //to download
  String? fileName;
  String? base64Data;

  CityModelResponse({this.city_code, this.city_name, this.created_by, this.created_date, this.changed_by, this.changed_date
    ,this.fileName, this.base64Data});

  factory CityModelResponse.fromJson(Map<String, dynamic>json){
    return CityModelResponse(city_code: json["cityCode"].toString()
      ,city_name: json["cityName"].toString()
      ,created_by: json["createdBy"].toString()
      ,created_date: json["createdTime"].toString()
      ,changed_by: json["updateBy"]!=null ? json["updateBy"].toString() :  ''
      ,changed_date: json["updateTime"]!=null ? json["updateTime"].toString() : ''
    );
  }

  factory CityModelResponse.fromJson_AddEditCity(Map<String, dynamic>json){
    return CityModelResponse(
        city_code: json["cityCode"].toString()
        ,city_name: json["cityName"].toString()
        ,created_by: json["createdBy"].toString()
        ,created_date: json["createdTime"].toString()
        ,changed_by: json["updateBy"]!=null ? json["updateBy"].toString() :  ''
        ,changed_date: json["updateTime"]!=null ? json["updateTime"].toString() : '');
  }

  factory CityModelResponse.fromJson_DeleteCity(Map<String, dynamic>json){
    return CityModelResponse(
        city_code: json["cityCode"]!=null ? json["cityCode"].toString() :  ''
        ,city_name: json["cityName"]!=null ? json["cityName"].toString() :  ''
        ,created_by: json["createdBy"]!=null ? json["createdBy"].toString() :  ''
        ,created_date: json["createdTime"]!=null ? json["createdTime"].toString() : ''
        ,changed_by: json["updateBy"]!=null ? json["updateBy"].toString() :  ''
        ,changed_date: json["updateTime"]!=null ? json["updateTime"].toString() : '');
  }

  factory CityModelResponse.fromJson_DownloadCity(Map<String, dynamic>json){
    return CityModelResponse(fileName: json["fileName"].toString()
        ,base64Data: json["base64Data"].toString()
    );
  }
}