import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/helpers/extensions.dart';
import 'package:h2m_destrib/features/pages/customers/UI/widgets/customers_top_bar.dart';

import '../../../../core/Routing/routes.dart';
import '../../../../core/Theming/colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../Home/UI/widgets/homebanner.dart';
import 'widgets/customers_page_listview.dart';

class CustomersDataPage extends StatelessWidget {
  const CustomersDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        shape: const CircleBorder(),
        onPressed: () {
          context.pushNamed(Routes.customerEditScreen);
        },
        backgroundColor: ColorManager.mainAccent,
        child: const Icon(
          Icons.add,
          color: ColorManager.mainWhite,
          size: 30,
        ),
      ),
      backgroundColor: ColorManager.mainColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity.w,
            margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomersTopBar(),
                spacingVertical(5),
                const HomeBanner(currIndex: 3),
                spacingVertical(8),
                const CustomersPageListview(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
