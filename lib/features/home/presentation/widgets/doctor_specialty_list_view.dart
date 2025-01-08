import 'package:docdoc/features/home/domain/entities/home_response_entity.dart';
import 'package:docdoc/features/home/presentation/widgets/doctor_specialty_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialtyListView extends StatelessWidget {
  final List<SpecializationEntity> specializationEntity;
  const DoctorSpecialtyListView(
      {super.key, required this.specializationEntity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationEntity.length,
        itemBuilder: (context, index) {
          return DoctorSpecialtyListViewItem(
            specializationEntity: specializationEntity[index],
            index: index,
          );
        },
      ),
    );
  }
}
