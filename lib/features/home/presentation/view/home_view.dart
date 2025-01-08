import 'package:docdoc/core/helper/dialog_helper.dart';
import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theme/app_colors.dart';
import 'package:docdoc/core/theme/app_styles.dart';
import 'package:docdoc/features/home/domain/entities/home_response_entity.dart';
import 'package:docdoc/features/home/presentation/controller/home_cubit/home_cubit.dart';
import 'package:docdoc/features/home/presentation/widgets/doctor_specialty_list_view.dart';
import 'package:docdoc/features/home/presentation/widgets/doctor_specialty_see_all.dart';
import 'package:docdoc/features/home/presentation/widgets/doctors_blue_container.dart';
import 'package:docdoc/features/home/presentation/widgets/doctors_list_view.dart';
import 'package:docdoc/features/home/presentation/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(
            20,
            16,
            20,
            28,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalSpace(height: 24.h),
              const DoctorSpecialtySeeAll(),
              verticalSpace(height: 18.h),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    current is HomeDiscountedInternetState ||
                    current is HomeFailureState ||
                    current is HomeSuccessState ||
                    current is SpeciallyLoadingState,
                builder: (context, state) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    switch (state) {
                      case SpeciallyLoadingState():
                        DialogHelper.showLoadingDialog(
                          context: context,
                          indicatorColor: AppColors.mainBlue,
                        );
                        break;
                      case HomeDiscountedInternetState():
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
                      case HomeFailureState():
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
                      default:
                    }
                  });

                  if (state is HomeSuccessState) {
                    DataEntity? list =
                        state.homeResponseEntity.data as DataEntity?;
                    List<SpecializationEntity>? s = list!.doctors
                        ?.map((e) => (e.specialization))
                        .toList()
                        .cast<SpecializationEntity>();

                    return Expanded(
                      child: Column(
                        children: [
                          DoctorSpecialtyListView(
                            specializationEntity: s ?? [],
                          ),
                          verticalSpace(height: 8.h),
                          DoctorsListView(
                            doctorsList: list.doctors,
                          ),
                        ],
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
