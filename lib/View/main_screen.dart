import 'package:expense_tracker/Controllers/transaction_controller.dart';
import 'package:expense_tracker/Core/color.dart';
import 'package:expense_tracker/Core/primary_button.dart';
import 'package:expense_tracker/Core/routing/approutes.dart';
import 'package:expense_tracker/Core/text_styles.dart';
import 'package:expense_tracker/Models/item_model.dart';
import 'package:expense_tracker/View/add_transaction_screen.dart';
import 'package:expense_tracker/View/main_screen_widgets/SlideAnimation.dart';
import 'package:expense_tracker/View/main_screen_widgets/categories_widget.dart';
import 'package:expense_tracker/View/main_screen_widgets/chart_widget.dart';
import 'package:expense_tracker/View/main_screen_widgets/item_cards.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double bills = 0,
      food = 0,
      shopping = 0,
      transport = 0,
      total = 0,
      offSetX = 0;
  TransactionController transactionController = TransactionController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  int touchedIndex = -1;
  bool isLoading = true;

  late List<ItemModel> response = [];
  getData() async {
    response = await transactionController.readData("SELECT * FROM expenses");
    bills = 0;
    food = 0;
    shopping = 0;
    transport = 0;
    total = 0;
    offSetX = 0;
    response.forEach((item) {
      if (item.category == "Bills") bills += item.price;
      if (item.category == "Food") food += item.price;
      if (item.category == "Shopping") shopping += item.price;
      if (item.category == "Transport") transport += item.price;
      total += item.price;
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(25.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Expense Tracker",
                style: AppStyles.title,
                textAlign: TextAlign.left,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ChartWidget(sections: showingSections()),
                          Positioned(
                            child: Text(
                              response.isNotEmpty ? "\$ $total" : "\$ 0",
                              style: AppStyles.title.copyWith(fontSize: 20.sp),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CategoriesWidget(),
                ],
              ),
              SizedBox(height: 30.h),
              response.isEmpty
                  ? Text(
                      "No data to be shown",
                      style: AppStyles.bodyText,
                      textAlign: TextAlign.center,
                    )
                  : isLoading
                  ? CircularProgressIndicator(color: AppColors.primaryBlue)
                  : AnimatedList(
                      key: ValueKey(response.length),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      initialItemCount: response.length,
                      itemBuilder: (context, index, animation) {
                        final item = response[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SlideAnimation(
                            itemModel: response[index],
                            onDelete: () async {
                              await transactionController.deleteData(
                                "DELETE FROM expenses WHERE id = ${response[index].id}",
                              );
                              if (response[index].category == "Food") {
                                food -= item.price;
                              }
                              if (response[index].category == "Bills") {
                                bills -= item.price;
                              }
                              if (response[index].category == "Transport") {
                                transport -= item.price;
                              }
                              if (response[index].category == "Shopping") {
                                shopping -= item.price;
                              }
                              total -= item.price;
                              _listKey.currentState?.removeItem(
                                index,
                                (context, SlideAnimation) => SizedBox.shrink(),
                              );
                              setState(() {
                                response.removeAt(index);
                              });
                            },
                          ),
                        );
                      },
                    ),
              response.length <= 3
                  ? SizedBox(height: 300.h)
                  : SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await GoRouter.of(context).pushNamed(Approutes.transactionScreen);
          await getData();
        },
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: AppColors.background,
        child: Icon(Icons.add),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      return switch (i) {
        0 => PieChartSectionData(
          color: AppColors.food,
          value: food / (total > 0 ? total : 1) * 100,
          radius: 40.r,
          showTitle: false,
        ),
        1 => PieChartSectionData(
          color: AppColors.bills,
          value: bills / (total > 0 ? total : 1) * 100,
          radius: 40.r,
          showTitle: false,
        ),
        2 => PieChartSectionData(
          color: AppColors.transport,
          value: transport / (total > 0 ? total : 1) * 100,
          radius: 40.r,
          showTitle: false,
        ),
        3 => PieChartSectionData(
          color: AppColors.shopping,
          value: shopping / (total > 0 ? total : 1) * 100,
          radius: 40.r,
          showTitle: false,
        ),
        _ => throw StateError('Invalid'),
      };
    });
  }
}
