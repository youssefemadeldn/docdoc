import 'package:dio/dio.dart';
import 'package:docdoc/core/network/api_constant.dart';
import 'package:docdoc/features/login/data/models/login_request_body_model.dart';
import 'package:docdoc/features/login/data/models/login_response_model.dart';
import 'package:docdoc/features/sign_up/data/models/sing_up_request_body_model.dart';
import 'package:docdoc/features/sign_up/data/models/sing_up_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @POST(ApiConstant.login)
  Future<LoginResponseModel> login(
      @Body() LoginRequestBodyModel loginRequestBody);

  @POST(ApiConstant.signUp)
  Future<SingUpResponseModel> signUp(
      @Body() SingUpRequestBodyModel singUpRequestBodyModel);
}
