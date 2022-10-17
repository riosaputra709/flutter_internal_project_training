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
          String? id = await createCity(event.model);
          emit(CreateCitySuccess(id));
        }
      }
      catch (e) {
        emit(SampleErrorState(e.toString()));
      }
    });
  }

  /*Future<String?> create(UserModel model) async {
    var response = await api.create(
      body: model.toMap(), //kirim ke API
    ) as Map<String, dynamic>;
    UserModel newUser = UserModel.map(response); //terima response dari API

    return newUser.id;
  }*/

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


  Future<String?> createCity(CityModelRequest model) async {
    var response = await api.createCity(
      body: model.toMapCreateCity(), //kirim ke API
    ) as Map<String, dynamic>;
    CityModelResponse newCity = CityModelResponse.fromJson(response); //terima response dari API

    return newCity.city_code;
  }

}
