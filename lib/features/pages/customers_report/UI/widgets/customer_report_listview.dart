import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h2m_destrib/core/wedgits/app_text_button.dart';
import 'package:h2m_destrib/features/pages/customers_report/data/models/customer_report_response.dart';

import '../../../../../core/Theming/colors.dart';
import '../../../../../core/Theming/styles.dart';
import '../../../../../core/helpers/mainclass.dart';
import '../../data/models/customers_report_request_body.dart';
import '../../logic/cubit/customers_report_cubit.dart';
import 'customer_reportItem_card.dart';

class CustomerReportListview extends StatefulWidget {
  const CustomerReportListview({
    super.key,
  });

  @override
  State<CustomerReportListview> createState() => _CustomerReportListviewState();
}

class _CustomerReportListviewState extends State<CustomerReportListview> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CustomersReportCubit>();

    // Map<String, dynamic> reportItem = {
    //   "date_hrka": "2025-03-06",
    //   "wasf_harka": "تعديل الفاتورة رقم 18",
    //   "egmaley": 9000.000,
    //   "mortga": 0.000,
    //   "mohsal": 5000.000,
    //   "mosdad": 0.000,
    // };
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => state is CustomersReportStateSuccess
          ? cubit.customersReportList.isNotEmpty
              ? ReportList()
              : Center(
                  child: Text('لا يوجد بيانات متاحة',
                      style: TextStyles.titleLargeLight(context)))
          : state is CustomersReportStateError
              ? Center(
                  child: Text(state.error,
                      style: TextStyles.titleSmallLight(context)),
                )
              : Center(
                  child: SizedBox(
                    height: 120.0,
                    width: 120.0,
                    child: CircularProgressIndicator(
                      color: ColorManager.darkAccent,
                      strokeWidth: 10.0,
                    ),
                  ),
                ),
    );
  }
}

class ReportList extends StatelessWidget {
  const ReportList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CustomersReportCubit>();
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: cubit.customersReportList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return index ==
                  cubit.customersReportList
                      .length /*&&
              cubit.customersReportList.length > 10*/
              ? cubit.customersReportList.length < 10
                  ? SizedBox.shrink()
                  : Center(
                      child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: AppTextButton(
                          backgroundColor: ColorManager.darkAccent,
                          buttonText: 'عرض المزيد',
                          textStyle: TextStyles.titleLargeLight(context),
                          onPressed: () {
                            cubit.qountPage += 10;
                            cubit.requestBody = CustomersReportRequestBody(
                              date1: cubit.dateFromController.text,
                              date2: cubit.dateToController.text,
                              id_amel: cubit.currCustId,
                              id_mosam_bee_omla: int.parse(MainClass.idMosam),
                              id_frea_shrka: int.parse(MainClass.idFreaShrka),
                              qountPage: cubit.qountPage,
                            );
                            cubit.emitCustomersStates(cubit.requestBody);
                          }),
                    ))
              : CustomerReportitemCard(
                  index: index + 1,
                  reportItem: cubit.customersReportList[index],
                );
        },
      ),
    );
  }
}
