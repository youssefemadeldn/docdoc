import 'package:docdoc/core/helper/dialog_helper.dart';
import 'package:docdoc/core/helper/extinctions.dart';
import 'package:docdoc/core/routes/routes.dart';
import 'package:docdoc/core/theme/app_colors.dart';
import 'package:docdoc/core/theme/app_styles.dart';
import 'package:docdoc/features/login/presentation/controller/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoadingState ||
          current is LoginFailureState ||
          current is LoginSuccessState ||
          current is LoginDiscountedInternetState,
      listener: (context, state) {
        switch (state) {
          case LoginLoadingState():
            DialogHelper.showLoadingDialog(
                context: context, indicatorColor: AppColors.mainBlue);
            break;
          case LoginDiscountedInternetState():
            DialogHelper.hideLoadingDialog(context);
            DialogHelper.showCustomDialog(
              context: context,
              content: 'No Internet Connection',
              contentStyle: AppStyles.font8DarkBlueMedium,
              leftActionStyle: AppStyles.font10BlueSemiBold,
              rightActionStyle: AppStyles.font10BlueSemiBold,
              title: Icon(
                Icons.wifi_off,
                color: AppColors.red,
                size: 25.r,
              ),
            );
            break;
          case LoginFailureState():
            DialogHelper.hideLoadingDialog(context);
            DialogHelper.showCustomDialog(
              context: context,
              title: Icon(
                Icons.error,
                color: AppColors.red,
                size: 25.r,
              ),
              content: state.failure.errorMessage,
              contentStyle: AppStyles.font8DarkBlueMedium,
              leftActionStyle: AppStyles.font10BlueSemiBold,
              rightActionStyle: AppStyles.font10BlueSemiBold,
            );
            break;
          case LoginSuccessState():
            DialogHelper.hideLoadingDialog(context);
            context.pushNamed(Routes.homeView);
            break;
          default:
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
