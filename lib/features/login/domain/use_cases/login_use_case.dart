import 'package:dartz/dartz.dart';
import 'package:docdoc/core/error/failure.dart';
import 'package:docdoc/features/login/data/models/login_request_body_model.dart';
import 'package:docdoc/features/login/domain/entities/login_response_entity.dart';
import 'package:docdoc/features/login/domain/repo/base_login_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  BaseLoginRepo baseLoginRepo;

  LoginUseCase({required this.baseLoginRepo});

  Future<Either<Failure, LoginResponseEntity>> call(
      {required LoginRequestBodyModel loginRequestBodyModel}) {
    return baseLoginRepo.login(loginRequestBodyModel: loginRequestBodyModel);
  }
}
