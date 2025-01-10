import 'package:json_annotation/json_annotation.dart';
part 'home_response_model.g.dart';

@JsonSerializable()
class HomeResponseModel {
  String? message;
  List<DataModel>? data;
  bool? status;
  int? code;

  HomeResponseModel({this.message, this.data, this.status, this.code});

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseModelFromJson(json);
}

@JsonSerializable()
class DataModel {
  int? id;
  String? name;
  List<DoctorsModel>? doctors;

  DataModel({this.id, this.name, this.doctors});

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
}

@JsonSerializable()
class DoctorsModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? description;
  String? degree;
  SpecializationModel? specialization;
  CityModel? city;
  int? appointPrice;
  String? startTime;
  String? endTime;

  DoctorsModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.photo,
      this.gender,
      this.address,
      this.description,
      this.degree,
      this.specialization,
      this.city,
      this.appointPrice,
      this.startTime,
      this.endTime});

  factory DoctorsModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorsModelFromJson(json);
}

@JsonSerializable()
class SpecializationModel {
  int? id;
  String? name;

  SpecializationModel({this.id, this.name});

  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationModelFromJson(json);
}

@JsonSerializable()
class CityModel {
  int? id;
  String? name;
  SpecializationModel? governrate;

  CityModel({this.id, this.name, this.governrate});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
