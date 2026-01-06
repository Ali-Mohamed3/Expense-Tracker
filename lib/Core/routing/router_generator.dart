import 'package:expense_tracker/Core/routing/approutes.dart';
import 'package:expense_tracker/View/add_transaction_screen.dart';
import 'package:expense_tracker/View/main_screen.dart';
import 'package:go_router/go_router.dart';

class RouterGenerator {
  static GoRouter mainRouting = GoRouter(
    initialLocation: Approutes.mainScreen,
    routes: [
      GoRoute(
        path: Approutes.mainScreen,
        name: Approutes.mainScreen,
        builder: (context, state) => MainScreen(),
      ),
      GoRoute(
        path: Approutes.transactionScreen,
        name: Approutes.transactionScreen,
        builder: (context, state) => AddTransactionScreen(),
      ),
    ],
  );
}
