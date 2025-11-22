import 'package:flutter/material.dart';
import 'package:h2m_destrib/core/Routing/routes.dart';
import 'package:h2m_destrib/features/Home/UI/home_screen.dart';
import 'package:h2m_destrib/features/login/UI/login_screen.dart';
import 'package:h2m_destrib/features/onboarding/onboarding_screen.dart';

import '../../features/pages/customers/UI/customers_data_page.dart';
import '../../features/pages/customers/UI/widgets/customer_edit_page.dart';
import '../../features/pages/customers_report/UI/customers_report_page.dart';
import '../../features/pages/sales/orders/UI/orders_edit_page.dart';
import '../../features/pages/sales/orders/logic/cubit/order_add_cubit.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.customersReportScreen:
        return MaterialPageRoute(
          builder: (_) => const CustomersReportPage(),
        );

      case Routes.orderAddScreen:
        OrdersAddCubit.clearData();
        return MaterialPageRoute(builder: (_) => OrdersEditPage());
      case Routes.customerEditScreen:
        return MaterialPageRoute(builder: (_) => const CustomerEditPage());
      case Routes.customersScreen:
        return MaterialPageRoute(
          builder: (_) => const CustomersDataPage(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text("Page not found check network connection"),
                  ),
                ));
    }
  }
}
