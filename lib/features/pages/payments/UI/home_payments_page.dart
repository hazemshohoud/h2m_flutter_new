import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/wedgits/app_form_text_field.dart';
import 'package:h2m_destrib/core/wedgits/app_text_button.dart';
import 'package:h2m_destrib/features/Home/logic/cubits/branches_cubit.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/Debendncy injection/debendncy_injection.dart';
import '../../../../core/Theming/colors.dart';
import '../../../../core/Theming/styles.dart';
import '../../../../core/helpers/mainclass.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../Home/logic/cubits/get_mandoben_cubit.dart';
import '../../customers/logic/cubit/customers_cubit.dart';
import '../Data/models/add_cust_payments_request_body.dart';
import '../Data/models/delete_payment_request_body.dart';
import '../Data/models/get_payments_request_body.dart';
import '../logic/cubit/cust_payments_cubit.dart';
import '../logic/state/add_cust_payments_state.dart';

class HomePaymentsPage extends StatefulWidget {
  const HomePaymentsPage({super.key});

  @override
  State<HomePaymentsPage> createState() => _HomePaymentsPageState();
}

List<dynamic> _branchesList = [];
List<dynamic> _MandobenList = [];

class _HomePaymentsPageState extends State<HomePaymentsPage> {
  String _dateFrom = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String _dateTo =
      DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 1)));

  int _pageCount = 10;
  @override
  void initState() {
    super.initState();
    if (_branchesList.isEmpty) {
      getBranches();
    }

    _getInitialData(context, _dateFrom, _dateTo, _pageCount);
  }

  @override
  Widget build(BuildContext context) {
    if (_branchesList.isEmpty) {
      getBranches();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (MainClass.h2m_isAdmin)
            ? Column(
                children: [
                  Row(
                    children: [
                      Center(
                          child: Text(
                        'مدفوعات العملاء',
                        style: TextStyles.headlineSmallLight(context),
                      )),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          _getInitialData(
                            context,
                            _dateFrom,
                            _dateTo,
                            10,
                          );
                        },
                        child: Icon(
                          Icons.refresh,
                          size: 45.sp,
                          color: ColorManager.mainAccent,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            getBranches();
                            _showBranchDialog(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r)),
                              color: ColorManager.mainAccent,
                            ),
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(MainClass.reportFreaShrkaName,
                                      style:
                                          TextStyles.bodyLargeLight(context)),
                                )),
                          ),
                        ),
                      ),
                      spacingHorizontal(5),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)),
                            color: ColorManager.mainAccent,
                          ),
                          child: InkWell(
                            onTap: () {
                              _shoMAndobDialog(context);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(MainClass.reportMandobnName,
                                    style: TextStyles.bodyLargeLight(context)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Row(children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                          color: ColorManager.mainAccent,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: InkWell(
                          onTap: () => _showDatePickerFrom(context),
                          child: IntrinsicHeight(
                            child: AppFormTextField(
                              controller: context
                                  .read<CustPaymentsCubit>()
                                  .dateFromController,
                              enabled: false,
                              readOnly: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 4.h),
                              backgroundColor: ColorManager.mainAccent,
                              hintText: DateFormat('yyyy-MM-dd')
                                  .format(DateTime.now()),
                              validator: (value) => null,
                              textStyle: TextStyles.titleSmallLight(context),
                              onChanged: (value) {
                                _dateFrom = value!.toString();
                                _dateTo = DateTime.now().toString();

                                setState(() {});
                              },
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: InkWell(
                          onTap: () {
                            if (MainClass.reportIdFreaShrka == '') {
                              MainClass.showMessageDialog(
                                  context, 'تحذير', 'يجب تحديد الفرع', 1);
                              return;
                            }

                            _showDatePickerTo(context);
                          },
                          child: AppFormTextField(
                            controller: context
                                .read<CustPaymentsCubit>()
                                .dateToController,
                            enabled: false,
                            readOnly: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                            ),
                            backgroundColor: ColorManager.mainAccent,
                            hintText:
                                DateFormat('yyyy-MM-dd').format(DateTime.now()),
                            validator: (value) => null,
                            textStyle: TextStyles.titleSmallLight(context),
                            onChanged: (value) {
                              _dateFrom = value!.toString();
                              _dateTo = DateTime.now().toString();
                            },
                          ),
                        ),
                      ),
                    ),
                  ]),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: FittedBox(
                      child: Text(
                        'مدفوعات العملاء ',
                        style: TextStyles.bodyMediumLight(context),
                      ),
                    ),
                  ),
                ],
              ),
        spacingVertical(8),
        Container(
          decoration: BoxDecoration(
              color: ColorManager.mainAccent,
              borderRadius: BorderRadius.all(Radius.circular(8.r))),
          child: Column(
            children: [
              Table(
                border: TableBorder.lerp(
                  TableBorder.all(color: ColorManager.mainColor, width: 1.0),
                  TableBorder.all(color: ColorManager.mainColor, width: 1.0),
                  0.5,
                ),
                columnWidths: {
                  0: FlexColumnWidth(4),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(3),
                },
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: (MainClass.h2m_isAdmin)
                          ? Center(
                              child: Text('إسم العميل',
                                  style: TextStyles.bodyLargeLight(context)
                                      .copyWith(fontWeight: FontWeight.bold)),
                            )
                          : InkWell(
                              onTap: () async {
                                if (await MainClass.checkShift(context)) {
                                  _showCustDialog(context);
                                } else {
                                  MainClass.showMessageDialog(
                                      context,
                                      'التحصيل',
                                      'يرجى التأكد من فتح وردية جديدة',
                                      0);
                                }
                              },
                              child: Center(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text('إضغط للإضافة',
                                          style: TextStyles.bodyMediumLight(
                                              context)),
                                    ),
                                    Icon(
                                      Icons.add_box_sharp,
                                      color: ColorManager.mainWhite,
                                    )
                                  ],
                                ),
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text('المحصل',
                            style: TextStyles.bodyLargeLight(context).copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Center(
                    //     child: Text('رصيد',
                    //         style: TextStyles.bodyMediumDark(context).copyWith(
                    //           fontWeight: FontWeight.bold,
                    //         )),
                    //   ),
                    // ),
                  ]),
                ],
              ),
              BlocBuilder(
                bloc: getIt.get<CustPaymentsCubit>(),
                builder: (context, state) => state == CustPaymentsStateLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Table(
                        border: TableBorder.lerp(
                          TableBorder.all(
                              color: ColorManager.mainColor, width: 1.0),
                          TableBorder.all(
                              color: ColorManager.mainColor, width: 1.0),
                          0.5,
                        ),
                        columnWidths: {
                          0: FlexColumnWidth(4),
                          1: FlexColumnWidth(2),
                          // 2: FlexColumnWidth(3),
                        },
                        children: List.generate(
                          CustPaymentsCubit.paymentsList.length,
                          (index) => TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                          CustPaymentsCubit.paymentsList[index]
                                              ['NameAmel'],
                                          style: TextStyles.bodyMediumLight(
                                              context)),
                                    ),
                                    (CustPaymentsCubit.paymentsList[index]
                                                    ['Nkdeey']
                                                .toString() ==
                                            '1')
                                        ? InkWell(
                                            onTap: () => _deleteItem(
                                                int.parse(CustPaymentsCubit
                                                    .paymentsList[index]
                                                        ['IdHrka']
                                                    .toString()),
                                                context),
                                            child: Icon(
                                              Icons.delete,
                                              color: ColorManager.mainColor,
                                            ),
                                          )
                                        : SizedBox()
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                    CustPaymentsCubit.paymentsList[index]
                                            ['Mohsal']
                                        .toString(),
                                    style: TextStyles.bodyMediumLight(context)),
                              ),
                            ),
                            // Padding(
                            //     padding: const EdgeInsets.all(8.0),
                            //     child: Center(
                            //       child: Text(
                            //           CustPaymentsCubit.paymentsList[index]
                            //                   ['RasedAmel']
                            //               .toString(),
                            //           style: TextStyles.bodyMediumDark(context)),
                            //     )),
                          ]),
                        )),
              ),
            ],
          ),
        ),
        Visibility(
          visible: CustPaymentsCubit.paymentsList.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: AppTextButton(
                backgroundColor: ColorManager.mainAccent,
                buttonText: 'عرض المزيد',
                textStyle: TextStyles.titleLargeLight(context),
                onPressed: () {
                  setState(() {
                    _pageCount += 10;
                  });
                  //_pageCount = CustPaymentsCubit.paymentsList.length;
                  _getInitialData(context, _dateFrom, _dateTo, _pageCount);
                }),
          ),
        ),
      ],
    );
  }

  void _showCustDialog(BuildContext context) {
    List<dynamic> customersList = context.read<CustomersCubit>().customersList;
    int itemCount = customersList.length;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text('اختر العميل'),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              height: MediaQuery.of(context).size.height * .5,
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
                          CustPaymentsCubit.currCustName =
                              customersList[index]["NameAMel"].toString();
                          CustPaymentsCubit.currCustId =
                              customersList[index]["IdAmel"].toInt();
                          CustPaymentsCubit.custOldDebitController.text =
                              customersList[index]["CreditAmel"].toString();
                          Navigator.pop(context);
                          _showPaymentDialog(context);
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

  void _getInitialData(
      BuildContext context, String dateFrom, String dateTo, int count) async {
    CustPaymentsCubit.paymentsList = [];
    //if (dateFrom == dateTo) {
    //}
    context
        .read<CustPaymentsCubit>()
        .emitGetCustPaymentStates(GetPaymentsRequestBody(
          quentomla: count,
          id_mosam_bee_omla:
              int.parse(MainClass.idMosam == '' ? '1' : MainClass.idMosam),
          date1: dateFrom,
          date2: dateTo,
          id_frea_shrka: int.parse((MainClass.h2m_isAdmin)
              ? MainClass.reportIdFreaShrka
              : MainClass.idFreaShrka),
        ));
  }

  void _showPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: FittedBox(
              child: Text(
                  'دفعة من حساب السيد / ${CustPaymentsCubit.currCustName}')),
          content: Form(
            key: context.read<CustPaymentsCubit>().formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    AppFormTextField(
                      readOnly: true,
                      controller: CustPaymentsCubit.custOldDebitController,
                      labelText: 'مستحق عليه',
                      textAlign: TextAlign.center,
                      hintText: '0.00',
                      validator: (value) {
                        return null;
                      },
                    ),
                    AppFormTextField(
                      controller: CustPaymentsCubit.paiedAmountController,
                      labelText: 'قيمة المسدد',
                      textAlign: TextAlign.center,
                      hintText: '0.00',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'لا يمكن ان يكون فارغ';
                        }
                        return null;
                      },
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: AppTextButton(
                          buttonText: 'تأكيد',
                          textStyle: TextStyles.bodyMediumLight(context),
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            int idMandob = int.parse(
                                prefs.getString('h2m_user_id') ?? '0');
                            int idMosam = int.parse(
                                prefs.getString('h2m_idMosam') ?? '0');
                            if (context
                                .read<CustPaymentsCubit>()
                                .formKey
                                .currentState!
                                .validate()) {
                              MainClass.getPrefsValues();
                              context
                                  .read<CustPaymentsCubit>()
                                  .emitAddCustPaymentStates(
                                    AddCustPaymentsRequestBody(
                                      id_mandob: idMandob,
                                      id_mosam_bee_omla: idMosam,
                                      id_wardia: int.parse(MainClass.idWardia),
                                      date_hrka: DateTime.now().toString(),
                                      khzna: MainClass.khazna,
                                      mplegh_mdfo: double.parse(
                                          CustPaymentsCubit
                                              .paiedAmountController.text),
                                      id_frea_shrka:
                                          int.parse(MainClass.idFreaShrka),
                                      id_amel: CustPaymentsCubit.currCustId,
                                      wasf_harka:
                                          'تحصيل من حساب / ${CustPaymentsCubit.currCustName}',
                                    ),
                                  );
                              _getInitialData(context, _dateFrom, _dateTo, 10);
                              Navigator.pop(context);
                            }
                          },
                        ))
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _deleteItem(int idHraka, BuildContext context) async {
    MainClass.getPrefsValues();
    await context
        .read<CustPaymentsCubit>()
        .emitDeleteCustPaymentStates(DeletePaymentRequestBody(
          id_hrka: idHraka,
          date_hrka: DateTime.now().toString(),
          user_Name: MainClass.userName,
        ));
    _getInitialData(context, _dateFrom, _dateTo, 10);
  }

  void _showBranchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('حدد الفرع'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.height * .5,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: GetBranchesCubit.branchesList.length,
              itemBuilder: (context, int index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      MainClass.reportIdFreaShrka = GetBranchesCubit
                          .branchesList[index]['IdShrka']
                          .toString();
                      MainClass.reportFreaShrkaName = GetBranchesCubit
                          .branchesList[index]['NameShrka']
                          .toString();
                      getMandoben();
                    });
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: ColorManager.mainAccent,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          GetBranchesCubit.branchesList[index]['NameShrka']
                              .toString(),
                          style: TextStyles.bodyLargeLight(context),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void getBranches() async {
    print('getBranches >>>> ${GetBranchesCubit.branchesList}');
    await context
        .read<GetBranchesCubit>()
        .geBranchesList()
        .then((value) => setState(() {
              _branchesList = value;
            }));
  }

  void getMandoben() async {
    //GetMandobenCubit.MandobenList.clear();
    print('getMandoben >>>> ${GetMandobenCubit.mandobenList}');
    await context
        .read<GetMandobenCubit>()
        .gemandobenList(int.parse(MainClass.reportIdFreaShrka))
        .then((value) => setState(() {
              _MandobenList = value;
            }));
  }

  void _shoMAndobDialog(BuildContext context) {
    getMandoben();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('حدد المندوب'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.height * .5,
            child: (_MandobenList.isEmpty)
                ? Center(
                    child: Text('لا يوجد مندوبين'),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: GetMandobenCubit.mandobenList.length,
                    itemBuilder: (context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            MainClass.reportIdMakhzan = GetMandobenCubit
                                .mandobenList[index]['IdMndob']
                                .toString();
                            MainClass.reportMandobnName = GetMandobenCubit
                                .mandobenList[index]['NameMandob']
                                .toString();
                          });
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            height: 80.h,
                            decoration: BoxDecoration(
                              color: ColorManager.mainAccent,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: Text(
                                GetMandobenCubit.mandobenList[index]
                                        ['NameMandob']
                                    .toString(),
                                style: TextStyles.bodyLargeLight(context),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }

  Future<void> _showDatePickerFrom(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      setState(() {
        _dateFrom = DateFormat('yyyy-MM-dd').format(pickedDate);
        _dateTo = DateFormat('yyyy-MM-dd').format(DateTime.now());
        context.read<CustPaymentsCubit>().dateFromController.text = _dateFrom;
      });
    }
  }

  Future<void> _showDatePickerTo(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      setState(() {
        _dateTo = DateFormat('yyyy-MM-dd').format(pickedDate);
        context.read<CustPaymentsCubit>().dateToController.text = _dateTo;
      });
    }
  }
}
