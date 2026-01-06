import 'package:expense_tracker/Core/color.dart';
import 'package:expense_tracker/Core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final void Function() onTap;
  final String? text;
  final double? width;
  final double? height;
  const PrimaryButton({
    super.key,
    required this.onTap,
    this.height,
    this.text,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        fixedSize: Size(width ?? 250.w, height ?? 60.h),
      ),
      child: Text(
        text ?? "Add expense",
        style: AppStyles.bodyText.copyWith(color: Colors.white),
      ),
    );
  }
}
