import 'package:docdoc/features/sign_up/data/models/sing_up_response_model.dart';
import 'package:docdoc/features/sign_up/domain/entities/sign_up_response_entity.dart';

class SingUpMapper {
  static SignUpResponseEntity toDomain(
      SingUpResponseModel singUpResponseModel) {
    return SignUpResponseEntity(
        code: singUpResponseModel.code,
        message: singUpResponseModel.message,
        status: singUpResponseModel.status,
        data: mapUserData(singUpResponseModel.data!));
  }

  static UserDataEntity mapUserData(UserDataModel userDataModel) {
    return UserDataEntity(
        username: userDataModel.username, token: userDataModel.token);
  }
}
