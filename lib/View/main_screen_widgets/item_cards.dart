import 'package:expense_tracker/Controllers/transaction_controller.dart';
import 'package:expense_tracker/Core/app_assets.dart';
import 'package:expense_tracker/Core/color.dart';
import 'package:expense_tracker/Core/text_styles.dart';
import 'package:expense_tracker/Models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCards extends StatelessWidget {
  final String name;
  final String category;
  final double price;

  ItemCards({
    super.key,
    required this.category,
    required this.name,
    required this.price,
  });

  TransactionController transactionController = TransactionController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(10.sp),
      width: width * .98,
      height: height * .1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.background,
        border: Border.all(width: .1.w, color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (category == 'Food')
                SvgPicture.asset(AppAssets.food, width: 40.w, height: 40.h),
              if (category == 'Bills')
                SvgPicture.asset(AppAssets.bills, width: 40.w, height: 40.h),
              if (category == 'Transport')
                SvgPicture.asset(
                  AppAssets.transport,
                  width: 40.w,
                  height: 40.h,
                ),
              if (category == 'Shopping')
                SvgPicture.asset(AppAssets.shopping, width: 40.w, height: 40.h),
              SizedBox(width: 20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150.w,
                    child: Text(
                      name,
                      style: AppStyles.cardTitle.copyWith(fontSize: 25.sp),
                      maxLines: 1,
                    ),
                  ),
                  Text(
                    category,
                    style: AppStyles.subtitle.copyWith(fontSize: 20.sp),
                  ),
                ],
              ),
            ],
          ),

          if (category == 'Food')
            Text(
              "$price \$",
              style: AppStyles.subtitle.copyWith(color: AppColors.food),
            ),

          if (category == 'Bills')
            Text(
              "$price \$",
              style: AppStyles.subtitle.copyWith(color: AppColors.bills),
            ),
          if (category == 'Transport')
            Text(
              "$price \$",
              style: AppStyles.subtitle.copyWith(color: AppColors.transport),
            ),
          if (category == 'Shopping')
            Text(
              "$price \$",
              style: AppStyles.subtitle.copyWith(color: AppColors.shopping),
            ),
        ],
      ),
    );
  }
}
