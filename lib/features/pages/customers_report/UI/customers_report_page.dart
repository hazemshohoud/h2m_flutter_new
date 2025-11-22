import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/helpers/mainclass.dart';
import 'package:h2m_destrib/features/pages/customers_report/UI/widgets/customers_report_filtering.dart';
import 'package:h2m_destrib/features/pages/customers_report/data/models/customers_report_request_body.dart';

import '../../../../core/Theming/colors.dart';
import '../../../../core/Theming/styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../logic/cubit/customers_report_cubit.dart';
import 'widgets/customer_report_listview.dart';
import 'widgets/customers_report_top_bar.dart';

class CustomersReportPage extends StatefulWidget {
  const CustomersReportPage({super.key});

  @override
  State<CustomersReportPage> createState() => _CustomersReportPageState();
}

class _CustomersReportPageState extends State<CustomersReportPage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      MainClass.getPrefsValues();
    });
    var cubit = context.read<CustomersReportCubit>();

    cubit.emitCustomersStates(cubit.requestBody);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CustomersReportCubit>();
    return Scaffold(
      // bottomSheet: BottomSheet(
      //     onClosing: () {},
      //     builder: (context) {
      //       return Container(
      //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      //         width: double.infinity.w,
      //         decoration: const BoxDecoration(
      //             color: ColorManager.darkAccent,
      //             borderRadius: BorderRadius.only(
      //               topLeft: Radius.circular(16),
      //               topRight: Radius.circular(16),
      //             )),
      //         child: IntrinsicHeight(
      //           child: Row(
      //             children: [
      //               Expanded(
      //                 flex: 1,
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       'إجمالي الفترة :\n${cubit.totalPeriod}',
      //                       style: TextStyles.bodySmallLight(context),
      //                     ),
      //                     Text(
      //                       'مرتجع الفترة :\n${cubit.totalPeriod}',
      //                       style: TextStyles.bodySmallLight(context),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               Expanded(
      //                 flex: 1,
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       'محصل الفترة :\n${cubit.totalPeriod}',
      //                       style: TextStyles.bodySmallLight(context),
      //                     ),
      //                     Text(
      //                       'سداد الفترة :\n${cubit.totalPeriod}',
      //                       style: TextStyles.bodySmallLight(context),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       );
      //     }),
      backgroundColor: ColorManager.mainColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity.w,
                    margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        cubit.qountPage = 10;
                        cubit.emitCustomersStates(CustomersReportRequestBody(
                          date1: cubit.dateFromController.text,
                          date2: cubit.dateToController.text,
                          id_amel: cubit.currCustId,
                          id_mosam_bee_omla: int.parse(MainClass.idMosam),
                          id_frea_shrka: int.parse(MainClass.idFreaShrka),
                          qountPage: cubit.qountPage,
                        ));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomersReportTopBar(),
                          spacingVertical(4),
                          const CustomersReportFiltering(),
                          spacingVertical(4),
                          Expanded(child: CustomerReportListview()),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      width: double.infinity.w,
                      decoration: const BoxDecoration(
                        color: ColorManager.darkAccent,
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'إجمالي الفترة :\n${cubit.totalPeriod}',
                                    style: TextStyles.bodySmallLight(context),
                                  ),
                                  Text(
                                    'مرتجع الفترة :\n${cubit.totalReturns}',
                                    style: TextStyles.bodySmallLight(context),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'محصل الفترة :\n${cubit.totalCustPaied}',
                                    style: TextStyles.bodySmallLight(context),
                                  ),
                                  Text(
                                    'سداد الفترة :\n${cubit.totalPays}',
                                    style: TextStyles.bodySmallLight(context),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
