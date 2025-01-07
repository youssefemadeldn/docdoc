import 'package:docdoc/features/home/domain/entities/home_response_entity.dart';
import 'package:docdoc/features/home/presentation/widgets/doctor_specialty_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialtyListView extends StatelessWidget {
  final List<DataEntity> dataEntity;
  const DoctorSpecialtyListView({super.key, required this.dataEntity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      // child: ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemCount: 8,
      //   itemBuilder: (context, index) {
      //     return DoctorSpecialtyListViewItem(
      //       specializationEntity: dataEntity[index],
      //       index: index,
      //     );
      //   },
      // ),
    );
  }
}
