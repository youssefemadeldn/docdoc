import 'package:dartz/dartz.dart';
import 'package:docdoc/core/error/failure.dart';
import 'package:docdoc/features/login/data/models/login_request_body_model.dart';
import 'package:docdoc/features/login/domain/entities/login_response_entity.dart';

abstract class BaseLoginRepo {
  Future<Either<Failure, LoginResponseEntity>> login({
    required LoginRequestBodyModel loginRequestBodyModel,
  });
}
