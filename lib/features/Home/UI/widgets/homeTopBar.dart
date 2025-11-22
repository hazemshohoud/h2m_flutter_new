import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h2m_destrib/core/helpers/extensions.dart';
import 'package:h2m_destrib/features/pages/customers_report/logic/cubit/customers_report_cubit.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/Routing/routes.dart';
import '../../../../core/Theming/colors.dart';
import '../../../../core/Theming/styles.dart';
import '../../../../core/helpers/mainclass.dart';
import '../../../login/logic/cubit/login_cubit.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مرحبا ${(MainClass.h2m_isAdmin) ? MainClass.userName : context.read<LoginCubit>().mandoubName ?? 'اسم المندوب'}',
              style: TextStyles.headlineSmallLight(context),
            ),
            Text(
              (MainClass.currIndex == 1)
                  ? 'الرئيسية'
                  : (MainClass.currIndex == 2)
                      ? 'الدفعات'
                      : 'المخزون',
              style: TextStyles.titleMediumLight(context),
            ),
          ],
        ),
        const Spacer(),
        (MainClass.currIndex == 1 && !MainClass.h2m_isAdmin)
            ? InkWell(
                onTap: () {
                  context.pushNamed(Routes.orderAddScreen);
                },
                child: const CircleAvatar(
                  backgroundColor: ColorManager.mainAccent,
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 40,
                      color: ColorManager.mainWhite,
                    ),
                  ),
                ),
              )
            : SizedBox(),
        (MainClass.currIndex == 1 && MainClass.h2m_isAdmin)
            ? InkWell(
                onTap: () {
                  var cubit = context.read<CustomersReportCubit>();
                  cubit.dateFromController.text =
                      DateFormat('yyyy-MM-dd').format(DateTime.now());
                  cubit.dateToController.text =
                      DateFormat('yyyy-MM-dd').format(DateTime.now());
                  cubit.qountPage = 10;
                  cubit.currCustId = 0;
                  cubit.custNameTextController.text = '';
                  context.pushNamed(Routes.customersReportScreen);
                },
                child: const CircleAvatar(
                  backgroundColor: ColorManager.mainAccent,
                  child: Center(
                    child: Icon(
                      Icons.library_books_outlined,
                      size: 26,
                      color: ColorManager.mainWhite,
                    ),
                  ),
                ),
              )
            : SizedBox(),
        (MainClass.currIndex == 1)
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                child: InkWell(
                  onTap: () async {
                    MainClass.showMessageDialog(context, 'تسجيل الخروج',
                            'هل تريد بالفعل تسجيل الخروج من التطبيق ؟', 1)
                        .then((value) {
                      if (value) {
                        MainClass.clearCache().then((value) {
                          if (value) {
                            Navigator.pushReplacementNamed(
                                context, Routes.onboardingScreen);
                          }
                        });
                      }
                    });
                  },
                  child: const CircleAvatar(
                    backgroundColor: ColorManager.mainAccent,
                    child: Center(
                      child: Icon(
                        Icons.logout,
                        size: 25,
                        color: ColorManager.mainWhite,
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  Future<String> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('namemndob') ?? 'اسم المندوب';

    return name;
  }
}
