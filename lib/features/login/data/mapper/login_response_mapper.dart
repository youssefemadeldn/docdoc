import 'package:docdoc/features/login/data/models/login_response_model.dart';
import 'package:docdoc/features/login/domain/entities/login_response_entity.dart';

class LoginResponseMapper {
  static LoginResponseEntity toDomain(LoginResponseModel loginResponseModel) {
    return LoginResponseEntity(
      message: loginResponseModel.message!,
      userData: mapUserData(loginResponseModel.userDataModel!),
      status: loginResponseModel.status!,
      code: loginResponseModel.code!,
    );
  }

  static UserDataEntity mapUserData(UserDataModel userDataModel) {
    return UserDataEntity(
      token: userDataModel.token,
      userName: userDataModel.userName,
    );
  }

// you can implement toDomainList, if needed

// ex
/*
  static List<User> toDomainList(List<UserModel> models) {
      return models.map((model) => toDomain(model)).toList();
    }
*/
}
