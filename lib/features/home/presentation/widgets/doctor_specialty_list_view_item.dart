import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theme/app_colors.dart';
import 'package:docdoc/core/theme/app_styles.dart';
import 'package:docdoc/features/home/domain/entities/home_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorSpecialtyListViewItem extends StatelessWidget {
  final SpecializationEntity specializationEntity;
  final int index;
  const DoctorSpecialtyListViewItem(
      {super.key, required this.specializationEntity, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: index == 0 ? 0 : 24.w,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.lightBlue,
            child: SvgPicture.asset(
              'assets/svgs/general_speciality.svg',
              height: 40.h,
              width: 40.w,
            ),
          ),
          verticalSpace(height: 8.h),
          Text(
            specializationEntity.name ?? 'Specialization',
            style: AppStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
