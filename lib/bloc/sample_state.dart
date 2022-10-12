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
  final List<CityModel> cities;
  GetCitiesSuccess(this.cities);
}

class GetCitiesSuccess1 extends SampleState {
  final List<CityModel> cities;
  GetCitiesSuccess1(this.cities);
}

class CreateCitySuccess extends SampleState {
  final String? city_code;
  CreateCitySuccess(this.city_code);
}


