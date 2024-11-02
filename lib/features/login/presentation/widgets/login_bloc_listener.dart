import 'package:docdoc/core/helper/dialog_helper.dart';
import 'package:docdoc/core/helper/extinctions.dart';
import 'package:docdoc/core/routes/routes.dart';
import 'package:docdoc/core/theme/app_colors.dart';
import 'package:docdoc/core/theme/app_styles.dart';
import 'package:docdoc/features/login/presentation/controller/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoadingState ||
          current is LoginFailureState ||
          current is LoginSuccessState,
      listener: (context, state) {
        switch (state) {
          case LoginLoadingState():
            DialogHelper.showLoadingDialog(
                context: context, indicatorColor: AppColors.mainBlue);
            break;
          case LoginFailureState():
            DialogHelper.hideLoadingDialog(context);
            DialogHelper.showCustomDialog(
              context: context,
              title: state.failure.failureTitle,
              content: state.failure.errorMessage,
              contentStyle: AppStyles.font15DarkBlueMedium,
              leftActionStyle: AppStyles.font14BlueSemiBold,
              rightActionStyle: AppStyles.font14BlueSemiBold,
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
