part of 'sample_bloc.dart';

@immutable
abstract class SampleEvent {}


/*class InitialSearchCity extends SampleEvent {
  final CityModel model;
  final int pageNumber;
  InitialSearchCity(this.model, this.pageNumber);
}*/

class SearchCity extends SampleEvent {
  final String cityCode;
  final String cityName;
  final int pageNumber;
  final int maxPage;
  SearchCity(this.cityCode, this.cityName, this.pageNumber, this.maxPage);
}

class CreateCity extends SampleEvent {
  final RequestCityModel model;
  CreateCity(this.model);
}
