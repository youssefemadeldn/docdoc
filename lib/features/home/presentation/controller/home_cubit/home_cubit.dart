import 'package:bloc/bloc.dart';
import 'package:docdoc/core/error/failure.dart';
import 'package:docdoc/core/network/network_helper.dart';
import 'package:docdoc/features/home/domain/entities/home_response_entity.dart';
import 'package:docdoc/features/home/domain/use_cases/home_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeUseCase homeUseCase;

  HomeCubit({required this.homeUseCase}) : super(HomeInitialState());

  void getHomeData() async {
    emit(SpeciallyLoadingState());

    var isConnected = await NetworkHelper.checkInternet();
    if (!isConnected) {
      emit(HomeDiscountedInternetState());
    } else {
      var either = await homeUseCase.getSpeciallyDoctors();

      either.fold(
        (failure) => emit(HomeFailureState(failure: failure)),
        (response) => emit(HomeSuccessState(homeResponseEntity: response)),
      );
    }
  }
}
