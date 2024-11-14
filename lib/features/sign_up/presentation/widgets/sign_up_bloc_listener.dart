import 'package:docdoc/core/helper/dialog_helper.dart';
import 'package:docdoc/core/theme/app_colors.dart';
import 'package:docdoc/core/theme/app_styles.dart';
import 'package:docdoc/features/sign_up/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignLoadingState ||
          current is SignSuccessState ||
          current is SignFailureState ||
          current is SignUpDiscountedInternetState,
      listener: (context, state) {
        switch (state) {
          case SignLoadingState():
            DialogHelper.showLoadingDialog(
                context: context, indicatorColor: AppColors.mainBlue);

          case SignUpDiscountedInternetState():
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
          case SignSuccessState():
            DialogHelper.hideLoadingDialog(context);
            DialogHelper.showCustomDialog(
              context: context,
              content: 'Registered Successfully',
              contentStyle: AppStyles.font8DarkBlueMedium,
              leftActionStyle: AppStyles.font10BlueSemiBold,
              rightActionStyle: AppStyles.font10BlueSemiBold,
              title: Icon(
                Icons.check_circle,
                color: AppColors.green,
                size: 25.r,
              ),
            );
          case SignFailureState():
            DialogHelper.hideLoadingDialog(context);
            DialogHelper.showCustomDialog(
              context: context,
              title: Text(
                state.failure.failureTitle,
                style: AppStyles.font13DarkBlueMedium,
              ),
              content: state.failure.errorMessage,
              contentStyle: AppStyles.font8DarkBlueMedium,
              leftActionStyle: AppStyles.font10BlueSemiBold,
              rightActionStyle: AppStyles.font10BlueSemiBold,
            );
            break;
          default:
        }
        // state.whenOrNull(
        //   sigUupLoading: () {
        //     showDialog(
        //       context: context,
        //       builder: (context) => const Center(
        //         child: CircularProgressIndicator(
        //           color: ColorsManager.mainBlue,
        //         ),
        //       ),
        //     );
        //   },
        //   signupSuccess: (signupResponse) {
        //     context.pop();
        //     showSuccessDialog(context);
        //   },
        //   signupError: (error) {
        //     setupErrorState(context, error);
        //   },
        // );
      },
      child: const SizedBox.shrink(),
    );
  }
}
