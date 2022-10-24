class BaseListResponse<T> {

  String? page_no;
  String? page_size;
  String? total_data_in_page;
  String? total_data;
  String? total_page;
  List<T>? list_data;

  String? data;
  String? status;
  String? message;

  BaseListResponse({this.page_no, this.page_size, this.total_data_in_page, this.total_data, this.total_page, this.list_data,
    this.status, this.data, this.message});

  factory BaseListResponse.fromJson(Map<String, dynamic>json, Function(List<dynamic>)build) {
    return BaseListResponse<T>(
        page_no: json["pageNo"].toString(),
        page_size: json["pageSize"].toString(),
        total_data_in_page: json["totalDataInPage"].toString(),
        total_data: json["totalData"].toString(),
        total_page: json["totalPages"].toString(),
        list_data: build(json["listData"]));
  }

  factory BaseListResponse.fromJson_AddEditCity(Map<String, dynamic>json, Function(List<dynamic>)build) {
    return BaseListResponse<T>(
        list_data: build(json["data"]));
  }

  factory BaseListResponse.fromJson_DeleteCity(Map<String, dynamic>json, Function(List<dynamic>)build) {
    return BaseListResponse<T>(
        list_data: build(json["data"]));
  }


  BaseListResponse.map(Map<String, dynamic> json) {
    status = json["status"]!=null ? json["status"].toString() :  '';
    message = json["message"]!=null ? json["message"].toString() :  '';
    data = json["data"]!=null ? json["data"].toString() :  '';
  }

}
