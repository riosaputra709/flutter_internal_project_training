part of 'sample_bloc.dart';

@immutable
abstract class SampleEvent {}


/*class InitialSearchCity extends SampleEvent {
  final CityModel model;
  final int pageNumber;
  InitialSearchCity(this.model, this.pageNumber);
}*/

class SearchCity extends SampleEvent {
  final CityModelRequest modelRequest;
  SearchCity(this.modelRequest);
}

class CreateCity extends SampleEvent {
  final CityModelRequest model;
  CreateCity(this.model);
}

class EditCity extends SampleEvent {
  final CityModelRequest model;
  EditCity(this.model);
}

class DeleteCity extends SampleEvent {
  String cityCode;
  DeleteCity(this.cityCode);
}

class DownloadCity extends SampleEvent {
  final String extention;
  final List<String> cityCd;
  DownloadCity(this.extention, this.cityCd);
}

class UploadCity extends SampleEvent {
  final File_Data_Model model;
  UploadCity(this.model);
}
