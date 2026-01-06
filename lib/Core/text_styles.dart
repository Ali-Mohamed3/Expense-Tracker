import 'package:expense_tracker/Core/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle title = GoogleFonts.inter(
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryBlack,
  );
  static TextStyle sectionTitle = GoogleFonts.inter(
    fontSize: 30.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlack,
  );
  static TextStyle cardTitle = GoogleFonts.inter(
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlack,
  );
  static TextStyle subtitle = GoogleFonts.inter(
    fontSize: 26.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryBlack,
  );
  static TextStyle bodyText = GoogleFonts.inter(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryBlack,
  );
  static TextStyle notes = GoogleFonts.inter(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );
}
