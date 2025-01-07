import 'package:docdoc/core/network/network_helper.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:docdoc/core/error/failure.dart';
import 'package:docdoc/features/login/domain/entities/login_response_entity.dart';
import 'package:docdoc/features/login/data/models/login_request_body_model.dart';
import 'package:docdoc/features/login/domain/use_cases/login_use_case.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  TextEditingController emailController =
      TextEditingController(text: 'jok@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Password@123');
  final formKey = GlobalKey<FormState>();
  LoginCubit({required this.loginUseCase}) : super(LoginInitialState());

  void emitLoginState() async {
    emit(LoginLoadingState());
    bool isConnected = await NetworkHelper.checkInternet();

    if (!isConnected) {
      emit(LoginDiscountedInternetState());
    } else {
      var either = await loginUseCase.call(
        loginRequestBodyModel: LoginRequestBodyModel(
          email: emailController.text,
          password: passwordController.text,
        ),
      );

      either.fold(
        (failure) => emit(LoginFailureState(failure: failure)),
        (response) => emit(LoginSuccessState(loginResponseEntity: response)),
      );
    }
  }
}
