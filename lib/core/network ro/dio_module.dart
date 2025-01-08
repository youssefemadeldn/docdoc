// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// @singleton
// class DioModule {
//   late Dio dio;

//   DioModule() {
//     dio = Dio(
//       BaseOptions(
//         connectTimeout: const Duration(seconds: 30),
//         receiveTimeout: const Duration(seconds: 30),
//         validateStatus: (status) => true,
//       ),
//     )..interceptors.add(
//         PrettyDioLogger(requestBody: true, requestHeader: true),
//       );
//   }
// }
