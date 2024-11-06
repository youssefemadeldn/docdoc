import 'package:dartz/dartz.dart';
import 'package:docdoc/core/error/failure.dart';
import 'package:docdoc/features/sign_up/data/models/sing_up_request_body_model.dart';
import 'package:docdoc/features/sign_up/domain/entities/sign_up_response_entity.dart';
import 'package:docdoc/features/sign_up/domain/repo/base_sign_up_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SingUpUseCase {
  BaseSignUpRepo baseSingUpRepo;

  SingUpUseCase({required this.baseSingUpRepo});
  Future<Either<Failure, SignUpResponseEntity>> singUp(
      {required SingUpRequestBodyModel singUpRequestBodyModel}) {
    return baseSingUpRepo.singUp(
        singUpRequestBodyModel: singUpRequestBodyModel);
  }
}
