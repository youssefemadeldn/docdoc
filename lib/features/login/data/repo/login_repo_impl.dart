import 'package:dartz/dartz.dart';
import 'package:docdoc/core/error/failure.dart';
import 'package:docdoc/features/login/data/data_sources/remote/base_remote_login_data_source.dart';
import 'package:docdoc/features/login/data/models/login_request_body_model.dart';
import 'package:docdoc/features/login/domain/entities/login_response_entity.dart';
import 'package:docdoc/features/login/domain/repo/base_login_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseLoginRepo)
class LoginRepoImpl extends BaseLoginRepo {
  BaseRemoteLoginDataSource baseRemoteLoginDataSource;
  LoginRepoImpl({required this.baseRemoteLoginDataSource});
  @override
  Future<Either<Failure, LoginResponseEntity>> login(
      {required LoginRequestBodyModel loginRequestBodyModel}) async {
    var either = await baseRemoteLoginDataSource.login(
        loginRequestBodyModel: loginRequestBodyModel);
    return either.fold(
      (failure) => left(failure),
      (response) => right(response),
    );
  }
}
