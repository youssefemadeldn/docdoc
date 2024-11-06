import 'package:bloc/bloc.dart';
import 'package:docdoc/core/error/failure.dart';
import 'package:docdoc/core/network/network_helper.dart';
import 'package:docdoc/features/sign_up/data/models/sing_up_request_body_model.dart';
import 'package:docdoc/features/sign_up/domain/entities/sign_up_response_entity.dart';
import 'package:docdoc/features/sign_up/domain/use_cases/sing_up_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  SingUpUseCase singUpUseCases;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  SignUpCubit({required this.singUpUseCases})
      : super(SignUpDiscountedInternetState());

  void emitSignUpStates() async {
    emit(SignLoadingState());
    bool isConnected = await NetworkHelper.checkInternet();
    if (!isConnected) {
      emit(SignUpDiscountedInternetState());
    } else {
      var either = await singUpUseCases.singUp(
        singUpRequestBodyModel: SingUpRequestBodyModel(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          gender: '0',
          password: passwordController.text,
          passwordConfirmation: passwordConfirmController.text,
        ),
      );

      either.fold(
        (l) => emit(
          SignFailureState(failure: l),
        ),
        (response) => emit(
          SignSuccessState(signUpResponseEntity: response),
        ),
      );
    }
  }
}
