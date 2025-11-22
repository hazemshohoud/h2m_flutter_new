import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/features/Home/UI/widgets/customer_item_card.dart';

import '../../../pages/customers/logic/cubit/customers_cubit.dart';

class CustomersListview extends StatefulWidget {
  const CustomersListview({super.key});

  @override
  State<CustomersListview> createState() => _CustomersListviewState();
}

class _CustomersListviewState extends State<CustomersListview> {
  List<dynamic> customersList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCustomers();
  }

  @override
  Widget build(BuildContext context) {
    if (customersList.isEmpty) {
      getCustomers();
    }
    return SizedBox(
        width: double.infinity.w,
        height: 150.h,
        //margin: EdgeInsets.only(bottom: 20.h),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: customersList == [] ? 0 : customersList.length,
          itemBuilder: (context, index) {
            return CustomerItemCard(customer: customersList[index]);
          },
        ));
  }

  void getCustomers() async {
    context.read<CustomersCubit>().getCustomersList(1, "", 10).then((value) {
      setState(() {
        customersList = value;
      });
    });
  }
}
