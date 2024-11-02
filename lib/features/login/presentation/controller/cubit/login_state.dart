part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginFailureState extends LoginState {
  final Failure failure;

  LoginFailureState({required this.failure});
}

final class LoginSuccessState extends LoginState {
  final LoginResponseEntity loginResponseEntity;

  LoginSuccessState({required this.loginResponseEntity});
}
