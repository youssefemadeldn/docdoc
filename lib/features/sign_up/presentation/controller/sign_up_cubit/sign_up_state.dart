part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitialState extends SignUpState {}

final class SignUpDiscountedInternetState extends SignUpState {}

final class SignLoadingState extends SignUpState {}

final class SignFailureState extends SignUpState {
  final Failure failure;

  SignFailureState({required this.failure});
}

final class SignSuccessState extends SignUpState {
  final SignUpResponseEntity signUpResponseEntity;

  SignSuccessState({required this.signUpResponseEntity});
}
