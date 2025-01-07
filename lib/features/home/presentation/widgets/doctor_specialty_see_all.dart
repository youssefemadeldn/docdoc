import 'package:docdoc/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class DoctorSpecialtySeeAll extends StatelessWidget {
  const DoctorSpecialtySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Doctor Specialty',
          style: AppStyles.font18DarkBlueSemiBold,
        ),
        const Spacer(),
        Text(
          'See all',
          style: AppStyles.font12MainBlueRegular,
        ),
      ],
    );
  }
}
