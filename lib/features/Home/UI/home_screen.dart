import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/Theming/colors.dart';
import 'package:h2m_destrib/core/helpers/mainclass.dart';
import '../../pages/payments/UI/home_payments_page.dart';
import '../../pages/sales/home_sales_page.dart';
import '../../pages/stores/UI/home_store_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeStorePage(),
      const HomeSalesPage(),
      HomePaymentsPage(),
    ];
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: ColorManager.mainColor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
              width: double.infinity.w,
              margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
              child: screens[MainClass.currIndex]),
        )),
        bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: ColorManager.darkAccent,
          index: MainClass.currIndex,
          onTap: (index) {
            setState(() {
              MainClass.currIndex = index;
            });
          },
          height: 55.h,
          color: ColorManager.darkAccent,
          backgroundColor: Colors.transparent,
          items: [
            (MainClass.currIndex == 0)
                ? Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.store,
                          size: 25.0,
                          color: ColorManager.mainWhite,
                        ),
                        Text(
                          'المخازن',
                          style: TextStyle(color: ColorManager.mainWhite),
                        ),
                      ],
                    ))
                : Icon(
                    Icons.store,
                    size: 25.0,
                    color: ColorManager.mainWhite,
                  ),
            (MainClass.currIndex == 1)
                ? Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: 25.0,
                          color: ColorManager.mainWhite,
                        ),
                        Text(
                          'الرئيسية',
                          style: TextStyle(color: ColorManager.mainWhite),
                        ),
                      ],
                    ))
                : Icon(
                    Icons.shopping_cart,
                    size: 25.0,
                    color: ColorManager.mainWhite,
                  ),
            (MainClass.currIndex == 2)
                ? Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.attach_money,
                          size: 25.0,
                          color: ColorManager.mainWhite,
                        ),
                        Text(
                          'التحصيل',
                          style: TextStyle(color: ColorManager.mainWhite),
                        ),
                      ],
                    ))
                : Icon(
                    Icons.attach_money,
                    size: 25.0,
                    color: ColorManager.mainWhite,
                  ),
          ],
        ),
      ),
    );
  }
}
