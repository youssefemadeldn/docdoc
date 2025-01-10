import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DoctorShimmer extends StatelessWidget {
  const DoctorShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                Shimmer.fromColors(
                  baseColor: AppColors.lightGrey,
                  highlightColor: AppColors.white,
                  child: Container(
                    // fit: BoxFit.cover,

                    width: 110.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                horizontalSpace(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: AppColors.lightGrey,
                        highlightColor: AppColors.white,
                        child: Container(
                          height: 18.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            color: AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      ),
                      verticalSpace(height: 7.h),
                      Shimmer.fromColors(
                        baseColor: AppColors.lightGrey,
                        highlightColor: AppColors.white,
                        child: Container(
                          height: 14.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            color: AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      ),
                      verticalSpace(height: 7.h),
                      Shimmer.fromColors(
                        baseColor: AppColors.lightGrey,
                        highlightColor: AppColors.white,
                        child: Container(
                          height: 14.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            color: AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      )
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
