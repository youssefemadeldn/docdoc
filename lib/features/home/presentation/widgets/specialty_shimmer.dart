import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class SpecialtyShimmer extends StatelessWidget {
  const SpecialtyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
              start: index == 0 ? 0 : 24.w,
            ),
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor: AppColors.lightGrey,
                  highlightColor: AppColors.white,
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.lightBlue,
                  ),
                ),
                verticalSpace(height: 8.h),
                Shimmer.fromColors(
                  baseColor: AppColors.lightGrey,
                  highlightColor: AppColors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    height: 14.h,
                    width: 50.w,
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
