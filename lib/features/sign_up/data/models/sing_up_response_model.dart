import 'package:json_annotation/json_annotation.dart';

part 'sing_up_response_model.g.dart';

@JsonSerializable()
class SingUpResponseModel {
  String? message;
  UserDataModel? data;
  bool? status;
  int? code;

  SingUpResponseModel({this.message, this.data, this.status, this.code});

  factory SingUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SingUpResponseModelFromJson(json);
}

@JsonSerializable()
class UserDataModel {
  String? token;
  String? username;

  UserDataModel({this.token, this.username});

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);
}
