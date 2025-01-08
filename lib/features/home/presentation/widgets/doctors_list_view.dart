import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theme/app_styles.dart';
import 'package:docdoc/features/home/domain/entities/home_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListView extends StatelessWidget {
  final List<DoctorsEntity?>? doctorsList;
  const DoctorsListView({super.key, required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList?.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    width: 110.w,
                    height: 120.h,
                    'https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050',
                    fit: BoxFit.cover,
                  ),
                ),
                horizontalSpace(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: AppStyles.font18DarkBlueBold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(height: 5),
                      Text(
                        'Degree | 0111111111111',
                        style: AppStyles.font12GreyMedium,
                      ),
                      verticalSpace(height: 5),
                      Text(
                        'Email@email.com',
                        style: AppStyles.font12GreyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
