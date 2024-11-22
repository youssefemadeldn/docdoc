import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theme/app_colors.dart';
import 'package:docdoc/features/home/presentation/widgets/doctor_specialty_list_view.dart';
import 'package:docdoc/features/home/presentation/widgets/doctor_specialty_see_all.dart';
import 'package:docdoc/features/home/presentation/widgets/doctors_blue_container.dart';
import 'package:docdoc/features/home/presentation/widgets/doctors_list_view.dart';
import 'package:docdoc/features/home/presentation/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';
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
              const DoctorSpecialtyListView(),
              verticalSpace(height: 8.h),
              const DoctorsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
