import 'package:cached_network_image/cached_network_image.dart';
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
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        "https://cdn.pixabay.com/photo/2023/12/15/18/32/ai-generated-8451270_640.png",
                    width: 110.w,
                    height: 120.h,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                horizontalSpace(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorsList?[index]?.name ?? 'Name',
                        style: AppStyles.font18DarkBlueBold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(height: 5),
                      Text(
                        doctorsList?[index]?.degree ?? 'Degree | 0111111111111',
                        style: AppStyles.font12GreyMedium,
                      ),
                      verticalSpace(height: 5),
                      Text(
                        doctorsList?[index]?.email ?? 'Email@email.com',
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
