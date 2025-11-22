import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h2m_destrib/core/Routing/routes.dart';
import 'package:h2m_destrib/core/Theming/colors.dart';
import 'package:h2m_destrib/core/Theming/styles.dart';
import 'package:h2m_destrib/core/helpers/extensions.dart';
import 'package:h2m_destrib/core/helpers/mainclass.dart';
import 'package:intl/intl.dart';

import '../../../pages/customers_report/data/models/customers_report_request_body.dart';
import '../../../pages/customers_report/logic/cubit/customers_report_cubit.dart';

class CustomerItemCard extends StatelessWidget {
  final Map<String, dynamic> customer;
  const CustomerItemCard({super.key, required this.customer});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: MainClass.h2m_isAdmin
          ? () async {
              MainClass.getPrefsValues().then((value) {
                var cubit = context.read<CustomersReportCubit>();
                cubit.currCustId = int.parse(
                    customer["IdAmel"].toString()); //customer["id_amel"];
                cubit.dateFromController.text = DateFormat('yyyy-MM-dd').format(
                    DateTime(DateTime.now().year, DateTime.now().month, 1));
                cubit.dateToController.text = DateFormat('yyyy-MM-dd').format(
                    DateTime(DateTime.now().year, DateTime.now().month + 1, 1));
                cubit.qountPage = 10;
                cubit.custNameTextController.text = customer["NameAMel"];
                cubit.requestBody = CustomersReportRequestBody(
                  date1: cubit.dateFromController.text,
                  date2: cubit.dateToController.text,
                  id_amel: cubit.currCustId,
                  id_mosam_bee_omla: int.parse(MainClass.idMosam),
                  id_frea_shrka: int.parse(MainClass.idFreaShrka),
                  qountPage: cubit.qountPage,
                );
                cubit.emitCustomersStates(cubit.requestBody);
              });
              context.pushNamed(Routes.customersReportScreen);
            }
          : null,
      child: Card(
        //clipBehavior: Clip.antiAlias,
        semanticContainer: true,
        margin: const EdgeInsets.fromLTRB(20, 8, 0, 8),
        color: ColorManager.mainAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2.0,
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    'الاسم :${customer["NameAMel"].toString()}',
                    style: TextStyles.titleMediumLight(context),
                  ),
                ),
                FittedBox(
                  child: Text('موبايل :${customer["tel"] ?? ''}',
                      style: TextStyles.titleMediumLight(context)
                          .copyWith(color: ColorManager.mainWhite)),
                ),
                FittedBox(
                  child: Text('مدين :${customer["CreditAmel"].toString()} ج.م',
                      style: TextStyles.titleMediumLight(context)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
