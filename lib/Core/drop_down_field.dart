import 'package:expense_tracker/Core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownField extends StatefulWidget {
  String? hintText;
  FormFieldValidator<dynamic>? validator;
  List<DropdownMenuItem>? items;
  double? height;
  double? width;
  ValueChanged<dynamic>? onChanged;
  DropDownField({
    super.key,
    this.hintText,
    this.validator,
    this.items,
    this.height,
    this.width,
    this.onChanged,
  });

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  @override
  Widget build(BuildContext context) {
    String? selectedValue;

    return SizedBox(
      width: widget.width ?? 450.w,
      height: widget.height ?? 70.h,
      child: DropdownButtonFormField(
        value: selectedValue,
        hint: Text(
          "${widget.hintText}",
          style: AppStyles.cardTitle.copyWith(
            fontSize: 20.h,
            color: Color(0xff8391A1),
          ),
        ),
        items: widget.items!,
        onChanged: widget.onChanged,
        validator: widget.validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20.sp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(width: 1.w, color: Color(0xff8391A1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(width: 1.w, color: Color(0xff8391A1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(width: 1.w, color: Color(0xff8391A1)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(width: 1.w, color: Color(0xff8391A1)),
          ),
        ),
        style: AppStyles.cardTitle.copyWith(fontSize: 5.sp),
      ),
    );
  }
}
