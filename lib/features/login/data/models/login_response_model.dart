import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  String? message;
  @JsonKey(name: 'data')
  UserDataModel? userDataModel;
  bool? status;
  int? code;

  LoginResponseModel(
      {this.message, this.userDataModel, this.status, this.code});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}

@JsonSerializable()
class UserDataModel {
  String? token;
  @JsonKey(name: 'username')
  String? userName;

  UserDataModel({this.token, this.userName});

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);
}
