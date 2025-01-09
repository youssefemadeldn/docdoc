import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:docdoc/core/error/failure.dart';
import 'package:docdoc/core/network/network_helper.dart';
import 'package:docdoc/core/network/rest_client.dart';
import 'package:docdoc/features/login/data/data_sources/remote/base_remote_login_data_source.dart';
import 'package:docdoc/features/login/data/mapper/login_mapper.dart';
import 'package:docdoc/features/login/data/models/login_request_body_model.dart';
import 'package:docdoc/features/login/data/models/login_response_model.dart';
import 'package:docdoc/features/login/domain/entities/login_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseRemoteLoginDataSource)
class RemoteLoginDataSourceImpl extends BaseRemoteLoginDataSource {
  final RestClient apiService;

  RemoteLoginDataSourceImpl({required this.apiService});
  @override
  Future<Either<Failure, LoginResponseEntity>> login(
      {required LoginRequestBodyModel loginRequestBodyModel}) async {
    // try {
    try {
      LoginResponseModel loginResponseModel =
          await apiService.login(loginRequestBodyModel);

      if (NetworkHelper.isValidResponse(code: loginResponseModel.code)) {
        // Success Case:
        //Mapping response to domain entity
        LoginResponseEntity loginResponseEntity =
            LoginMapper.toDomain(loginResponseModel);
        return right(loginResponseEntity);
      } else {
        // Server Error Case:
        return left(
          ServerFailure(
            failureTitle: 'Server Error',
            errorMessage: 'user name or password are incorrect',
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
      // General unexpected error
      return left(Failure(failureTitle: 'Failure', errorMessage: e.toString()));
    }
  }
}
