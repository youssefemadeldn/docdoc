import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/features/home/domain/entities/home_response_entity.dart';
import 'package:docdoc/features/home/presentation/controller/home_cubit/home_cubit.dart';
import 'package:docdoc/features/home/presentation/widgets/doctor_specialty_list_view.dart';
import 'package:docdoc/features/home/presentation/widgets/doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'doctor_shimmer.dart';
import 'specialty_shimmer.dart';

class HomeViewBlocConsumer extends StatelessWidget {
  const HomeViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccessState) {
          var response = state.homeResponseEntity.data;
          var doctorList = response
                  ?.where((e) => e.doctors != null)
                  .expand((e) => e.doctors!)
                  .toList() ??
              [];

          var speciallyList = doctorList
              .where((e) => e.specialization != null)
              .map((e) => e.specialization!)
              .fold<Map<String, SpecializationEntity>>({},
                  (map, specialization) {
                map[specialization.name ?? ''] = specialization;
                return map;
              })
              .values
              .toList();

          return Expanded(
            child: Column(
              children: [
                DoctorSpecialtyListView(
                  specializationEntity: speciallyList,
                ),
                verticalSpace(height: 8.h),
                DoctorsListView(
                  doctorsList: doctorList,
                ),
              ],
            ),
          );
        } else if (state is SpeciallyLoadingState) {
          return Expanded(
            child: Column(
              children: [
                const SpecialtyShimmer(),
                verticalSpace(height: 8.h),
                const DoctorShimmer(),
              ],
            ),
          );
          // SizedBox(
          //   height: 100.h,
          //   child: const Center(
          //     child: CircularProgressIndicator(),
          //   ),
          // );
        } else if (state is HomeFailureState) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.failure.errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                  // if (onRetry != null) ...[
                  //   const SizedBox(height: 16),
                  //   ElevatedButton(
                  //     onPressed: onRetry,
                  //     child: Text('Retry'),
                  //   ),
                  // ],
                ],
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
/*
 BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeDiscountedInternetState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
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
          });
        }

        if (state is HomeFailureState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
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
          });
        }
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is HomeSuccessState,
        builder: (context, state) {
          if (state is HomeSuccessState) {
            var response = state.homeResponseEntity.data;
            var doctorList = response
                    ?.where((e) => e.doctors != null)
                    .expand((e) => e.doctors!)
                    .toList() ??
                [];

            var speciallyList = doctorList
                .where((e) => e.specialization != null)
                .map((e) => e.specialization!)
                .fold<Map<String, SpecializationEntity>>({},
                    (map, specialization) {
                  map[specialization.name ?? ''] = specialization;
                  return map;
                })
                .values
                .toList();

            return Expanded(
              child: Column(
                children: [
                  DoctorSpecialtyListView(
                    specializationEntity: speciallyList,
                  ),
                  verticalSpace(height: 8.h),
                  DoctorsListView(
                    doctorsList: doctorList,
                  ),
                ],
              ),
            );
          } else if (state is SpeciallyLoadingState) {
            return SizedBox(
              height: 100.h,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
    */
