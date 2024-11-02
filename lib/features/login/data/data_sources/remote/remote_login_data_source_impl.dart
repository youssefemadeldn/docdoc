import 'package:dartz/dartz.dart';
import 'package:docdoc/core/error/failure.dart';
import 'package:docdoc/core/network/rest_client.dart';
import 'package:docdoc/core/network/network_helper.dart';
import 'package:docdoc/features/login/data/data_sources/remote/base_remote_login_data_source.dart';
import 'package:docdoc/features/login/data/mapper/login_response_mapper.dart';
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
    try {
      var isConnected = await NetworkHelper.checkInternet();

      if (isConnected) {
        //  Internet connection Case
        LoginResponseModel loginResponseModel =
            await apiService.login(loginRequestBodyModel);

        if (NetworkHelper.isValidResponse(code: loginResponseModel.code)) {
          // Success Case
          return right(LoginResponseMapper.toDomain(loginResponseModel));
        } else {
          // Server Error Case
          return left(ServerFailure(
              failureTitle: 'Server Failure',
              errorMessage: loginResponseModel.message!));
        }
      } else {
        // disconnected Internet Case
        return left(NetworkFailure(
            failureTitle: 'Network Failure', errorMessage: 'Check Internet'));
      }
    } catch (e) {
      return left(Failure(failureTitle: 'Failure', errorMessage: e.toString()));
    }
  }
}
