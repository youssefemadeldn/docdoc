import 'package:dio/dio.dart';
import 'package:docdoc/core/network/api_constant.dart';
import 'package:docdoc/core/network/rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio provideDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        validateStatus: (status) => true,
      ),
    );
    dio.interceptors
        .add(PrettyDioLogger(requestBody: true, requestHeader: true));
    return dio;
  }

  @lazySingleton
  RestClient provideRestClient(Dio dio) => RestClient(dio);
}
