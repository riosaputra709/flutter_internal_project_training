part of 'sample_bloc.dart';

@immutable
abstract class SampleState {}

class SampleInitial extends SampleState {}

class SampleLoading extends SampleState {}

class SampleErrorState extends SampleState{
  final String error;
  SampleErrorState(this.error);
}

class GetCitiesSuccess extends SampleState {
  final BaseListResponse<CityModelResponse> cities;
  GetCitiesSuccess(this.cities);
}

class CreateCitySuccess extends SampleState {
  final BaseListResponse<CityModelResponse> cities;
  CreateCitySuccess(this.cities);
}

class DeleteCitySuccess extends SampleState {
  final BaseListResponse<CityModelResponse> cities;
  DeleteCitySuccess(this.cities);
}

class DeleteCitySuccess1 extends SampleState {
  final String message;
  DeleteCitySuccess1(this.message);
}


