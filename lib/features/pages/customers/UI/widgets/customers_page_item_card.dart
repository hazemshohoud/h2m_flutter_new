import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/Theming/colors.dart';
import 'package:h2m_destrib/core/helpers/extensions.dart';
import 'package:h2m_destrib/core/helpers/mainclass.dart';
import 'package:intl/intl.dart';

import '../../../../../core/Routing/routes.dart';
import '../../../../../core/Theming/styles.dart';
import '../../../customers_report/data/models/customers_report_request_body.dart';
import '../../../customers_report/logic/cubit/customers_report_cubit.dart';

class CustomersPageItemCard extends StatelessWidget {
  final Map<String, dynamic> customer;
  const CustomersPageItemCard({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: !MainClass.h2m_isAdmin
            ? null
            : () async {
                await MainClass.getPrefsValues();
                var cubit = context.read<CustomersReportCubit>();
                cubit.custNameTextController.text =
                    customer["NameAMel"].toString();
                cubit.currCustId = int.parse(customer["IdAmel"].toString());
                cubit.dateFromController.text = DateFormat('yyyy-MM-dd').format(
                    DateTime(DateTime.now().year, DateTime.now().month, 1));
                cubit.dateToController.text = DateFormat('yyyy-MM-dd').format(
                    DateTime(DateTime.now().year, DateTime.now().month + 1, 1));
                cubit.qountPage = 10;
                cubit.requestBody = CustomersReportRequestBody(
                  date1: cubit.dateFromController.text,
                  date2: cubit.dateToController.text,
                  id_amel: cubit.currCustId,
                  id_mosam_bee_omla: int.parse(MainClass.idMosam),
                  id_frea_shrka: int.parse(MainClass.idFreaShrka),
                  qountPage: cubit.qountPage,
                );
                cubit.emitCustomersStates(cubit.requestBody);
                context.pushNamed(Routes.customersReportScreen);
              },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorManager.mainAccent,
                ColorManager.mainAccent,
                ColorManager.mainColor,
                ColorManager.mainWhite,
              ],
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          height: 100.h,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      semanticContainer: true,
                      elevation: 0.0,
                      color: ColorManager.mainAccent,
                      child: SizedBox(
                          width: 100,
                          height: 150,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                customer["NameAMel"].toString(),
                                style: TextStyles.titleMediumLight(context)
                                    .copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                  _getCustType(customer["now_amel"].toString()),
                                  style: TextStyles.titleMediumLight(context)
                                      .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          )))),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("موبايل: ${customer["tel"]}",
                            style: TextStyles.bodySmallDark(context).copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.mainWhite,
                            )),
                        Text("مدين :${customer["CreditAmel"].toString()}",
                            style: TextStyles.bodySmallDark(context).copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.mainWhite,
                            )),
                        Expanded(
                          child: Text(
                              "العنوان :${customer["email"].toString()}",
                              style: TextStyles.bodySmallDark(context).copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.mainWhite,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String _getCustType(String string) {
  switch (string) {
    case "1":
      return "نص جملة";
    case "2":
      return "جملة";
    default:
      return "مستهلك";
  }
}
