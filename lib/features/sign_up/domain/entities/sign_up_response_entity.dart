class SignUpResponseEntity {
  String? message;
  UserDataEntity? data;
  bool? status;
  int? code;

  SignUpResponseEntity({this.message, this.data, this.status, this.code});
}

class UserDataEntity {
  String? token;
  String? username;

  UserDataEntity({this.token, this.username});
}
