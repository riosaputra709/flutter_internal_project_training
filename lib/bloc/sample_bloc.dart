import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internal_project_training/model/city_model.dart';
import 'package:flutter_internal_project_training/model/request_city.dart';
import 'package:meta/meta.dart';

import '../Service/restapi.dart';

part 'sample_event.dart';
part 'sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  RestApi api = RestApi();
  SampleBloc() : super(SampleInitial()) {
    on<SampleEvent>((event, emit) async {
      try {
        emit(SampleLoading());
        if (event is SearchCity) {
          List<CityModel>? getCity = await searchCities(event.cityCode, event.cityName, event.pageNumber, event.maxPage);
          emit(GetCitiesSuccess1(getCity));
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

  Future<List<CityModel>> searchCities(String cityCode, String cityName, int pageNumber, int maxSize) async {
    List<CityModel> listModel = [];
    dynamic response = await api.ListCities1(
      cityCode, cityName, pageNumber, maxSize
    ) as Map;
    List listData = response["data"];
    for(var item in listData){
      listModel.add(CityModel.map(item));
    }
    return listModel;
  }

  Future<String?> createCity(RequestCityModel model) async {
    var response = await api.createCity(
      body: model.toMap(), //kirim ke API
    ) as Map<String, dynamic>;
    CityModel newCity = CityModel.map(response); //terima response dari API

    return newCity.city_code;
  }

}
