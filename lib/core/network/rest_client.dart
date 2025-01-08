// import 'package:dio/dio.dart' as dio;
import 'package:docdoc/core/network/api_constant.dart';
import 'package:docdoc/features/home/data/models/home_response_model.dart';
import 'package:docdoc/features/login/data/models/login_request_body_model.dart';
import 'package:docdoc/features/login/data/models/login_response_model.dart';
import 'package:docdoc/features/sign_up/data/models/sing_up_request_body_model.dart';
import 'package:docdoc/features/sign_up/data/models/sing_up_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'rest_client.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;
// Login Feather
  @POST(ApiConstant.loginEP)
  Future<LoginResponseModel> login(
      @Body() LoginRequestBodyModel loginRequestBody);
// Register Feather
  @POST(ApiConstant.signUpEP)
  Future<SingUpResponseModel> signUp(
      @Body() SingUpRequestBodyModel singUpRequestBodyModel);
// Home Feather
  @GET(ApiConstant.homeEP)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
    'Custom-Header': 'Your header',
  })
  Future<HomeResponseModel> getSpeciallyDoctors(
      @Header('Authorization') String token);
}
