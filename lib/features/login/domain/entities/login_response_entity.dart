class LoginResponseEntity {
  String? message;
  UserDataEntity? userData;
  bool? status;
  int? code;

  LoginResponseEntity({this.message, this.userData, this.status, this.code});
}

class UserDataEntity {
  String? token;
  String? userName;

  UserDataEntity({this.token, this.userName});
}
