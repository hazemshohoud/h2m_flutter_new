import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/features/pages/customers/UI/widgets/customers_page_item_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/Theming/styles.dart';
import '../../data/models/get_customers_request_body.dart';
import '../../logic/cubit/customers_cubit.dart';

class CustomersPageListview extends StatefulWidget {
  const CustomersPageListview({super.key});

  @override
  State<CustomersPageListview> createState() => _CustomersPageListviewState();
}

class _CustomersPageListviewState extends State<CustomersPageListview> {
  int count = 10;
  List<dynamic> customersList = [];
  int itemCount = 0;
  @override
  void initState() {
    super.initState();
    getCustList(context, count).then((value) {
      setState(() {
        customersList = value;

        itemCount = customersList.length + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (customersList.isEmpty) {
      getCustList(context, count).then((value) {
        setState(() {
          customersList = value;
          itemCount = customersList.length + 1;
        });
      });
    }
    return SizedBox(
        height: 450.h,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return index == customersList.length
                ? InkWell(
                    onTap: () {
                      setState(() {
                        count += 10;
                      });
                      getCustList(context, count).then((value) {
                        setState(() {
                          customersList = value;
                          itemCount = customersList.length + 1;
                        });
                      });
                    },
                    child: Center(
                      child: Text('عرض المزيد',
                          style: TextStyles.titleMediumLight(context)),
                    ),
                  )
                : CustomersPageItemCard(
                    customer: customersList[index > customersList.length
                        ? customersList.length
                        : index]);
          },
        ));
  }

  Future<List<dynamic>> getCustList(BuildContext context, int count) async {
    var prefs = await SharedPreferences.getInstance();
    String idFreaShrka = prefs.getString('h2m_idFreaShrka') ?? '1';
    var customersCubit = context.read<CustomersCubit>();
    await customersCubit.emitCustomersStates(GetCustomersRequestBody(
        id_frea_shrka: int.parse(idFreaShrka), name: "", quentomla: count));

    customersList = customersCubit.customersList;
    itemCount = customersList.length + 1;
    return customersList;
  }
}
