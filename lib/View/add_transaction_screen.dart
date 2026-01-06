import 'package:expense_tracker/Controllers/transaction_controller.dart';
import 'package:expense_tracker/Core/custom_text_field.dart';
import 'package:expense_tracker/Core/drop_down_field.dart';
import 'package:expense_tracker/Core/primary_button.dart';
import 'package:expense_tracker/Core/text_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  late TextEditingController price, name, month;
  final formKey = GlobalKey<FormState>();
  TransactionController transactionController = TransactionController();
  List<DropdownMenuItem<dynamic>> items = [
    DropdownMenuItem(
      value: "None",
      child: Text("None", style: AppStyles.cardTitle.copyWith(fontSize: 20.sp)),
    ),
    DropdownMenuItem(
      value: "Food",
      child: Text("Food", style: AppStyles.cardTitle.copyWith(fontSize: 20.sp)),
    ),
    DropdownMenuItem(
      value: "Bills",
      child: Text(
        "Bills",
        style: AppStyles.cardTitle.copyWith(fontSize: 20.sp),
      ),
    ),
    DropdownMenuItem(
      value: "Shopping",
      child: Text(
        "Shopping",
        style: AppStyles.cardTitle.copyWith(fontSize: 20.sp),
      ),
    ),
    DropdownMenuItem(
      value: "Transport",
      child: Text(
        "Transport",
        style: AppStyles.cardTitle.copyWith(fontSize: 20.sp),
      ),
    ),
  ];
  String? selectedValue;
  DateTime? pickedDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    price = TextEditingController();
    name = TextEditingController();
    month = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: EdgeInsets.all(40.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Add Transaction", style: AppStyles.title),
              SizedBox(height: 50.h),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: "Name",
                      width: 450.w,
                      controller: name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the name";
                        }
                      },
                      height: 100.h,
                    ),
                    DropDownField(
                      hintText: "Category",
                      validator: (value) {
                        if (value == null && value == "None") {
                          return "Please select a category";
                        }
                      },
                      onChanged: (value) {
                        selectedValue = value;
                        setState(() {});
                      },
                      items: items,
                    ),
                    SizedBox(height: 30.h),
                    CustomTextField(
                      hintText: "Price",
                      width: 450.w,
                      controller: price,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the price";
                        }
                      },
                      height: 100.h,
                      textInputType: TextInputType.numberWithOptions(),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      hintText: "Date",
                      width: 450.w,
                      controller: month,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the date";
                        }
                      },
                      height: 100.h,
                      isReadOnly: true,
                      isCalender: true,
                      tap: () async {
                        pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );

                        if (pickedDate != null) {
                          setState(() {
                            month.text =
                                "${pickedDate!.year}-${pickedDate!.month.toString().padLeft(2, '0')}-${pickedDate!.day.toString().padLeft(2, '0')}";
                          });
                        }
                      },
                    ),
                    SizedBox(height: 250.h),
                    PrimaryButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          transactionController.insertData(
                            "INSERT INTO expenses(name, price, category, month) "
                            "VALUES('${name.text}', '${price.text}', '$selectedValue', '${pickedDate!.month}')",
                          );

                          GoRouter.of(context).pop();
                          setState(() {});
                        }
                      },
                      width: 400.w,
                      height: 60.h,
                      text: "Add",
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
