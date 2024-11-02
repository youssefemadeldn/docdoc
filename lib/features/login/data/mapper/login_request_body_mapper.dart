import 'package:docdoc/features/login/data/models/login_request_body_model.dart';
import 'package:docdoc/features/login/domain/entities/login_request_body_entity.dart';

class LoginRequestBodyMapper {
  static LoginRequestBodyEntity toDomain(
      LoginRequestBodyModel loginRequestBodyModel) {
    return LoginRequestBodyEntity(
      email: loginRequestBodyModel.email,
      password: loginRequestBodyModel.password,
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
