import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:docdoc/core/error/failure.dart';
import 'package:docdoc/core/network/network_helper.dart';
import 'package:docdoc/core/network/rest_client.dart';
import 'package:docdoc/features/sign_up/data/data_sources/remote/base_remote_sign_up_data_source.dart';
import 'package:docdoc/features/sign_up/data/mapper/sing_up_mapper.dart';
import 'package:docdoc/features/sign_up/data/models/sing_up_request_body_model.dart';
import 'package:docdoc/features/sign_up/data/models/sing_up_response_model.dart';
import 'package:docdoc/features/sign_up/domain/entities/sign_up_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseRemoteSignUpDataSource)
class RemoteSignUpDataSourceImpl implements BaseRemoteSignUpDataSource {
  final RestClient restClient;

  RemoteSignUpDataSourceImpl({required this.restClient});

  @override
  Future<Either<Failure, SignUpResponseEntity>> signUp(
      {required SingUpRequestBodyModel singUpRequestBodyModel}) async {
    try {
      SingUpResponseModel signUpResponseModel =
          await restClient.signUp(singUpRequestBodyModel);

      if (NetworkHelper.isValidResponse(code: signUpResponseModel.code)) {
        // Success Case: Mapping response to domain entity
        SignUpResponseEntity signUpResponseEntity =
            SingUpMapper.toDomain(signUpResponseModel);
        return right(signUpResponseEntity);
      } else {
        // Return server error with message from the response
        return left(
          ServerFailure(
            failureTitle: 'Server Error',
            errorMessage: signUpResponseModel.message ?? 'Server Error',
          ),
        );
      }
    } on DioException {
      // Unexpected DioError (e.g., timeout, internet connection)
      return left(
        NetworkFailure(
          failureTitle: 'Network Error',
          errorMessage: 'Check Internet',
        ),
      );
    } catch (e) {
      return left(Failure(failureTitle: 'Failure', errorMessage: e.toString()));
    }
  }
}
