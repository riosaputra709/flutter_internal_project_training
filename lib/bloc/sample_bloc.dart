import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internal_project_training/model/city_model_request.dart';
import 'package:flutter_internal_project_training/model/city_model_response.dart';
import 'package:flutter_internal_project_training/model/file_data_upload.dart';
import 'package:meta/meta.dart';
import '../Service/restapi.dart';
import '../model/base_list_response.dart';

part 'sample_event.dart';
part 'sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  RestApi api = RestApi();
  SampleBloc() : super(SampleInitial()) {
    on<SampleEvent>((event, emit) async {
      try {
        emit(SampleLoading());
        if (event is SearchCity) {
          BaseListResponse<CityModelResponse>? getData = await searchCities(event.modelRequest);
          emit(GetCitiesSuccess(getData));
        }
        else if (event is CreateCity) {
          BaseListResponse<CityModelResponse>? getData = await createCity(event.model);
          emit(CreateCitySuccess(getData));
        }
        else if (event is EditCity) {
          BaseListResponse<CityModelResponse>? getData = await editCity(event.model);
          emit(EditCitySuccess(getData));
        }
        else if (event is DeleteCity) {
          /*BaseListResponse<CityModelResponse>? getData = await deleteCity(event.cityCode);
          emit(DeleteCitySuccess(getData));*/
          String? getData = await deleteCity1(event.cityCode);
          emit(DeleteCitySuccess1(getData!));
        }
        else if (event is DownloadCity) {
          CityModelResponse? getData = await downloadCity(event.extention, event.cityCd);
          emit(DownloadCitySuccess(getData));
        }
        else if (event is UploadCity) {
          BaseListResponse<CityModelResponse>? getData = await uploadCity(event.model);
          emit(CreateCitySuccess(getData));
        }
      }
      catch (e) {
        emit(SampleErrorState(e.toString()));
      }
    });
  }

  Future<BaseListResponse<CityModelResponse>> searchCities(CityModelRequest modelRequest) async {
    dynamic response = await api.ListCities(
      body: modelRequest.toMap()
    )as Map<String, dynamic>;
    var res = response["data"];
    var baseListResponse = BaseListResponse<CityModelResponse>.fromJson(res, (data) {
      List<CityModelResponse> city = data.map((e) => CityModelResponse.fromJson(e)).toList();
      return city;
    });
    return baseListResponse;
  }


  Future<BaseListResponse<CityModelResponse>> createCity(CityModelRequest model) async {
    var response = await api.createCity(
      body: model.toMapCreateCity(), //kirim ke API
    ) as Map<String, dynamic>;
    var baseListResponse = BaseListResponse<CityModelResponse>.fromJson_AddEditCity(response, (data) {
      List<CityModelResponse> city = data.map((e) => CityModelResponse.fromJson_AddEditCity(e)).toList();
      return city;
    });
    return baseListResponse;
  }

  Future<BaseListResponse<CityModelResponse>> uploadCity(File_Data_Model model) async {
    var response = await api.uplCity(model);
    var baseListResponse = BaseListResponse<CityModelResponse>.fromJson_AddEditCity(response, (data) {
      List<CityModelResponse> city = data.map((e) => CityModelResponse.fromJson_AddEditCity(e)).toList();
      return city;
    });
    return baseListResponse;

  }

  Future<BaseListResponse<CityModelResponse>> editCity(CityModelRequest model) async {
    var response = await api.editCity(
      body: model.toMapCreateCity(), //kirim ke API
    ) as Map<String, dynamic>;
    var baseListResponse = BaseListResponse<CityModelResponse>.fromJson_AddEditCity(response, (data) {
      List<CityModelResponse> city = data.map((e) => CityModelResponse.fromJson_AddEditCity(e)).toList();
      return city;
    });
    return baseListResponse;
  }

  Future<BaseListResponse<CityModelResponse>> deleteCity(String cityCode) async {
    dynamic response = await api.deleteCity(cityCode);
    var baseListResponse = BaseListResponse<CityModelResponse>.fromJson_DeleteCity(response, (data) {
      List<CityModelResponse> city = data.map((e) => CityModelResponse.fromJson_DeleteCity(e)).toList();
      return city;
    });
    return baseListResponse;
  }

  Future<String?> deleteCity1(String cityCode) async {
    var response = await api.deleteCity(cityCode);
    BaseListResponse bsr = BaseListResponse.map(response); //terima response dari API

    return bsr.message;
  }

  /*download [start]*/
  Future<CityModelResponse> downloadCity(String extension, List<String> cc) async {
    var response = await api.downloadCity(
      body: toMapDownloadCity(extension, cc), //kirim ke API
    ) as Map<String, dynamic>; //terima response dari API
    var resData = response["data"];
    CityModelResponse newCity = CityModelResponse.fromJson_DownloadCity(resData);
    return newCity;

  }

  Map<String, dynamic> toMapDownloadCity(String extension, List<String> cc) {
    final Map<String, dynamic> data = {};
    data['cityCode'] = cc;
    data['extension'] = extension == null? '' : extension.toString();
    return data;
  }
  /*download [end]*/

}
