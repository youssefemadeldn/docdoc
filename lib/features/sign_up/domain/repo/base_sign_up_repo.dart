import 'package:dartz/dartz.dart';
import 'package:docdoc/core/error/failure.dart';
import 'package:docdoc/features/sign_up/data/models/sing_up_request_body_model.dart';
import 'package:docdoc/features/sign_up/domain/entities/sign_up_response_entity.dart';

abstract class BaseSignUpRepo {
  Future<Either<Failure, SignUpResponseEntity>> singUp(
      {required SingUpRequestBodyModel singUpRequestBodyModel});
}
