import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:docdoc/core/error/failure.dart';
import 'package:docdoc/core/network/network_helper.dart';
import 'package:docdoc/core/network/rest_client.dart';
import 'package:docdoc/features/home/data/data_sources/remote/base_home_remote_data_source.dart';
import 'package:docdoc/features/home/data/mapper/home_mapper.dart';
import 'package:docdoc/features/home/data/models/home_response_model.dart';
import 'package:docdoc/features/home/domain/entities/home_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseHomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements BaseHomeRemoteDataSource {
  final RestClient restClient;

  HomeRemoteDataSourceImpl({required this.restClient});

  @override
  Future<Either<Failure, HomeResponseEntity>> getHomeData() async {
    try {
      HomeResponseModel homeResponseModel = await restClient.getSpeciallyDoctors(
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzM2MzE3MzI1LCJleHAiOjE3MzY0MDM3MjUsIm5iZiI6MTczNjMxNzMyNSwianRpIjoiNXVGQVNiSEd0dFZ2OG1NaiIsInN1YiI6IjI2NDkiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.2hTfbD7j-PrRZD17AxICxHu1lri-zxbcs928BL1QFJE');
      if (NetworkHelper.isValidResponse(code: homeResponseModel.code)) {
        // Success Case:
        //Mapping response to domain entity
        HomeResponseEntity homeResponseEntity =
            HomeMapper.toDomain(homeResponseModel);
        return right(homeResponseEntity);
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
      // General Error
      return left(Failure(failureTitle: 'Failure', errorMessage: e.toString()));
    }
  }
}
