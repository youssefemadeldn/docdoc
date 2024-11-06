import 'package:docdoc/features/login/data/models/login_response_model.dart';
import 'package:docdoc/features/login/domain/entities/login_response_entity.dart';

class LoginMapper {
  static LoginResponseEntity toDomain(LoginResponseModel loginResponseModel) {
    return LoginResponseEntity(
      message: loginResponseModel.message ?? '',
      userData: loginResponseModel.userDataModel != null
          ? mapUserData(loginResponseModel.userDataModel!)
          : null, // Handle null case here
      status: loginResponseModel.status ?? false,
      code: loginResponseModel.code ?? 0,
    );
  }

  static UserDataEntity? mapUserData(UserDataModel? userDataModel) {
    if (userDataModel == null) {
      return null; // Return null if userDataModel is null
    }
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
