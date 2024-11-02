class LoginResponseEntity {
  String message;
  UserDataEntity userData;
  bool status;
  int code;

  LoginResponseEntity(
      {required this.message,
      required this.userData,
      required this.status,
      required this.code});
}

class UserDataEntity {
  String? token;
  String? userName;

  UserDataEntity({this.token, this.userName});
}
