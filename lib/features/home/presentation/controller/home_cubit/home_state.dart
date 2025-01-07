part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeDiscountedInternetState extends HomeState {}

final class SpeciallyLoadingState extends HomeState {}

final class HomeFailureState extends HomeState {
  final Failure failure;
  HomeFailureState({required this.failure});
}

final class HomeSuccessState extends HomeState {
  final HomeResponseEntity homeResponseEntity;
  HomeSuccessState({required this.homeResponseEntity});
}

// final class DoctorLoadingState extends HomeState {}
// final class DoctorFailureState extends HomeState {}
// final class DoctorSuccessState extends HomeState {}
