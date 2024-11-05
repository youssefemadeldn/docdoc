import 'package:dartz/dartz.dart';
import 'package:docdoc/core/error/failure.dart';
import 'package:docdoc/features/sign_up/data/data_sources/remote/base_remote_sign_up_data_source.dart';
import 'package:docdoc/features/sign_up/data/models/sing_up_request_body_model.dart';
import 'package:docdoc/features/sign_up/domain/entities/sign_up_response_entity.dart';
import 'package:docdoc/features/sign_up/domain/repo/base_sign_up_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseSignUpRepo)
class SignUpRepoImpl implements BaseSignUpRepo {
  BaseRemoteSignUpDataSource baseRemoteSignUpDataSource;
  SignUpRepoImpl({required this.baseRemoteSignUpDataSource});
  @override
  Future<Either<Failure, SignUpResponseEntity>> singUp(
      {required SingUpRequestBodyModel singUpRequestBodyModel}) async {
    var either = await baseRemoteSignUpDataSource.signUp(
        singUpRequestBodyModel: singUpRequestBodyModel);

    return either.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }
}
