import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../Home/UI/widgets/customers_listview.dart';
import '../../Home/UI/widgets/customers_see_all.dart';
import '../../Home/UI/widgets/homeTopBar.dart';
import '../../Home/UI/widgets/homebanner.dart';
import '../../Home/UI/widgets/items_listview.dart';
import '../../Home/UI/widgets/items_see_all.dart';

class HomeSalesPage extends StatefulWidget {
  const HomeSalesPage({super.key});

  @override
  State<HomeSalesPage> createState() => _HomeSalesPageState();
}

class _HomeSalesPageState extends State<HomeSalesPage> {
  @override
  Widget build(BuildContext context) {
    //final String mandoubName = context.read<LoginCubit>().mandoubName ?? 'اسم المندوب';
    return SizedBox(
      height: MediaQuery.of(context).size.height - 20.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeTopBar(),
          spacingVertical(5),
          const HomeBanner(
            currIndex: 1,
          ),
          spacingVertical(8),
          const CustomersSeeAll(),
          const CustomersListview(),
          const ItemsSeeAll(),
          Expanded(child: const ItemsListview())
        ],
      ),
    );
  }
}
