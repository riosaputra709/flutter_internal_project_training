import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internal_project_training/model/city_model_request.dart';
import 'package:flutter_internal_project_training/model/city_model_response.dart';
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
        else if (event is DeleteCity) {
          /*BaseListResponse<CityModelResponse>? getData = await deleteCity(event.cityCode);
          emit(DeleteCitySuccess(getData));*/
          String? getData = await deleteCity1(event.cityCode);
          emit(DeleteCitySuccess1(getData!));
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
    var baseListResponse = BaseListResponse<CityModelResponse>.fromJson_AddCity(response, (data) {
      List<CityModelResponse> city = data.map((e) => CityModelResponse.fromJson_AddCity(e)).toList();
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

}
