import 'package:expense_tracker/Core/color.dart';
import 'package:expense_tracker/Core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 15.w,
              height: 15.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.food,
              ),
            ),
            SizedBox(width: 12.w),
            Text("Food", style: AppStyles.subtitle.copyWith(fontSize: 20.sp)),
          ],
        ),
        Row(
          children: [
            Container(
              width: 15.w,
              height: 15.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.transport,
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              "Transport",
              style: AppStyles.subtitle.copyWith(fontSize: 20.sp),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 15.w,
              height: 15.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.bills,
              ),
            ),
            SizedBox(width: 12.w),
            Text("Bills", style: AppStyles.subtitle.copyWith(fontSize: 20.sp)),
          ],
        ),
        Row(
          children: [
            Container(
              width: 15.w,
              height: 15.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.shopping,
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              "Shopping",
              style: AppStyles.subtitle.copyWith(fontSize: 20.sp),
            ),
          ],
        ),
      ],
    );
  }
}
