import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';

class LoginResponseModel {
  String? message;
  UserDataModel? userDataModel;
  bool? status;
  int? code;

  LoginResponseModel(
      {this.message, this.userDataModel, this.status, this.code});

  factory LoginResponseModel.fromJson(dynamic json) {
    // Handle `data` field based on its type
    UserDataModel? userData;
    if (json['data'] is Map<String, dynamic>) {
      userData = UserDataModel.fromJson(json['data']);
    } else if (json['data'] is List && json['data'].isEmpty) {
      userData = null;
    }

    return LoginResponseModel(
      message: json['message'] as String?,
      userDataModel: userData,
      status: json['status'] as bool?,
      code: json['code'] as int?,
    );
  }
}

@JsonSerializable()
class UserDataModel {
  String? token;
  @JsonKey(name: 'username')
  String? userName;

  UserDataModel({this.token, this.userName});

  factory UserDataModel.fromJson(dynamic json) => _$UserDataModelFromJson(json);
}
