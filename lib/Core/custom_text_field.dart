import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final double? width;
  final double? height;
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool? isReadOnly;
  void Function()? tap;
  final bool? isCalender;
  CustomTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.width,
    this.isPassword,
    this.controller,
    this.validator,
    this.height,
    this.textInputType,
    this.isReadOnly,
    this.tap,
    this.isCalender,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 331.w,
      height: height ?? 100.h,
      child: TextFormField(
        readOnly: isReadOnly ?? false,
        controller: controller,
        validator: validator,
        keyboardType: textInputType ?? TextInputType.name,
        autofocus: false,
        obscureText: isPassword ?? false,
        decoration: InputDecoration(
          suffixIcon: isCalender != null
              ? Icon(Icons.calendar_month)
              : SizedBox.shrink(),
          hintText: hintText ?? "",
          hintStyle: TextStyle(
            fontSize: 20.sp,
            color: Color(0xff8391A1),
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: BorderSide(color: Color(0xff8391A1), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: BorderSide(width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: BorderSide(color: Color(0xff8391A1), width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: BorderSide(color: Color(0xff8391A1), width: 1),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        onTap: tap ?? () {},
      ),
    );
  }
}
