import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/features/pages/customers_report/data/models/customers_report_request_body.dart';
import 'package:h2m_destrib/features/pages/customers_report/logic/cubit/customers_report_cubit.dart';
import 'package:intl/intl.dart';

import '../../../../../core/Theming/colors.dart';
import '../../../../../core/Theming/styles.dart';
import '../../../../../core/helpers/mainclass.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/wedgits/app_form_text_field.dart';
import '../../../customers/logic/cubit/customers_cubit.dart';

class CustomersReportFiltering extends StatefulWidget {
  const CustomersReportFiltering({super.key});

  @override
  State<CustomersReportFiltering> createState() =>
      _CustomersReportFilteringState();
}

class _CustomersReportFilteringState extends State<CustomersReportFiltering> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CustomersReportCubit>();
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(children: [
          Expanded(
            child: InkWell(
              onTap: () {
                _showCustDialog(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  color: ColorManager.mainAccent,
                ),
                child: AppFormTextField(
                    controller: context
                        .read<CustomersReportCubit>()
                        .custNameTextController,
                    backgroundColor: ColorManager.mainAccent,
                    enabled: false,
                    enabledBorder: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.h),
                    textStyle: TextStyles.bodyLargeLight(context),
                    hintText: 'حدد العميل',
                    validator: (value) => null),
              ),
            ),
          ),
          // spacingHorizontal(5),
          // Expanded(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(20.r)),
          //       color: ColorManager.mainAccent,
          //     ),
          //     child: InkWell(
          //       onTap: () {},
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //         child: Padding(
          //           padding: const EdgeInsets.all(4.0),
          //           child: Text(MainClass.reportMakhzanName,
          //               style: TextStyles.bodyLargeLight(context)),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ]),
      ),
      SizedBox(
        height: 60.h,
        child: Row(children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                color: ColorManager.mainAccent,
              ),
              child: InkWell(
                onTap: () {
                  _showDatePickerFrom(context);
                },
                child: IntrinsicHeight(
                  child: AppFormTextField(
                    controller: cubit.dateFromController,
                    enabled: false,
                    readOnly: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    backgroundColor: ColorManager.mainAccent,
                    hintText: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                    validator: (value) => null,
                    textStyle: TextStyles.titleSmallLight(context),
                  ),
                ),
              ),
            ),
          ),
          spacingHorizontal(5),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                color: ColorManager.mainAccent,
              ),
              child: InkWell(
                onTap: () {
                  _showDatePickerTo(context);
                },
                child: IntrinsicHeight(
                  child: AppFormTextField(
                    onChanged: (value) {
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
                    },
                    controller: cubit.dateToController,
                    enabled: false,
                    readOnly: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    backgroundColor: ColorManager.mainAccent,
                    hintText: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                    validator: (value) => null,
                    textStyle: TextStyles.titleSmallLight(context),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    ]);
  }

  void _showCustDialog(BuildContext context) {
    List<dynamic> customersList = context.read<CustomersCubit>().customersList;
    int itemCount = customersList.length;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var cubit = context.read<CustomersReportCubit>();
        return AlertDialog(
            title: const Text('اختر العميل'),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * .7,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: itemCount,
                itemBuilder: (context, int index) {
                  //bool _custIsChecked = false;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: ColorManager.mainAccent,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: InkWell(
                        onTap: () {
                          cubit.custNameTextController.text =
                              customersList[index]["NameAMel"]
                                  .toString(); //to be used in report page
                          cubit.currCustId = int.parse(customersList[index]
                                  ["IdAmel"]
                              .toString()); //to be used in report page
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
                          Navigator.pop(context);
                        },
                        child: (customersList.isNotEmpty)
                            ? ListTile(
                                title: Text(
                                    customersList[index]["NameAMel"].toString(),
                                    style: TextStyles.bodyMediumLight(context)),
                                leading: Text(
                                  customersList[index]["CreditAmel"].toString(),
                                  style: TextStyles.bodyMediumLight(context),
                                ),
                              )
                            : SizedBox(),
                      ),
                    ),
                  );
                },
              ),
            ));
      },
    );
  }

  void _showDatePickerFrom(BuildContext context) async {
    var cubit = context.read<CustomersReportCubit>();
    cubit.dateFromController.text =
        DateFormat('yyyy-MM-dd').format(DateTime.now());
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      setState(() {
        cubit.dateFromController.text =
            DateFormat('yyyy-MM-dd').format(pickedDate);
        cubit.dateToController.text =
            DateFormat('yyyy-MM-dd').format(DateTime.now());
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
      });
    }
  }

  void _showDatePickerTo(BuildContext context) async {
    var cubit = context.read<CustomersReportCubit>();
    cubit.dateToController.text =
        DateFormat('yyyy-MM-dd').format(DateTime.now());
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      setState(() {
        cubit.dateToController.text =
            DateFormat('yyyy-MM-dd').format(pickedDate);
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
      });
    }
  }
}
