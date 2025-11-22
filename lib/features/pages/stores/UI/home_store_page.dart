import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/wedgits/app_form_text_field.dart';
import 'package:h2m_destrib/features/Home/logic/cubits/branches_cubit.dart';
import 'package:h2m_destrib/features/pages/stores/logic/cubit/storeitems_cubit.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/Theming/colors.dart';
import '../../../../core/Theming/styles.dart';
import '../../../../core/helpers/mainclass.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../Home/logic/cubits/get_stores_cubit.dart';
import '../data/models/harket_makhzan_request_body.dart';
import '../logic/state/get_store_items_state.dart';

class HomeStorePage extends StatefulWidget {
  const HomeStorePage({super.key});

  @override
  State<HomeStorePage> createState() => _HomeStorePageState();
}

class _HomeStorePageState extends State<HomeStorePage> {
  String _dateFrom = DateFormat('yyyy-MM-dd').format(DateTime.now());

  String _dateTo =
      DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 1)));

  List<dynamic> _branchesList = [];
  List<dynamic> _storesList = [];

  void getBranches() async {
    await context
        .read<GetBranchesCubit>()
        .geBranchesList()
        .then((value) => setState(() {
              _branchesList = value;
            }));
  }

  void getStores() async {
    //GetStoresCubit.StoresList.clear();
    print('getStores >>>> ${GetStoresCubit.StoresList}');
    await context
        .read<GetStoresCubit>()
        .geStoresList(int.parse(MainClass.reportIdFreaShrka))
        .then((value) => setState(() {
              _storesList = value;
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBranches();
    getStores();
    _dateFrom = DateFormat('yyyy-MM-dd').format(DateTime.now());
    _dateTo =
        DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 1)));

    _getInitialData(context, _dateFrom, _dateTo);
  }

  void _showStoreDialog(BuildContext context) {
    getStores();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('حدد المخزن'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.height * .5,
            child: (_storesList.isEmpty)
                ? Center(
                    child: Text('لا يوجد مخازن'),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: GetStoresCubit.StoresList.length,
                    itemBuilder: (context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            MainClass.reportIdMakhzan = GetStoresCubit
                                .StoresList[index]['Idmakhzan']
                                .toString();
                            MainClass.reportMakhzanName = GetStoresCubit
                                .StoresList[index]['NameMakjzan']
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
                                GetStoresCubit.StoresList[index]['NameMakjzan']
                                    .toString(),
                                style: TextStyles.titleLargeLight(context),
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
                          child: FittedBox(
                        child: Text(
                          'حركة المخزون',
                          style: TextStyles.headlineSmallLight(context),
                        ),
                      )),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          _getInitialData(context, _dateFrom, _dateTo);
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
                              _showStoreDialog(context);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(MainClass.reportMakhzanName,
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
                            horizontal: 4.0, vertical: 4.0),
                        child: InkWell(
                          onTap: () {
                            _showDatePickerFrom(context);
                          },
                          child: IntrinsicHeight(
                            child: AppFormTextField(
                              controller: context
                                  .read<GetStoresCubit>()
                                  .dateFromController,
                              // suffixIcon: Icon(
                              //   Icons.calendar_month,
                              //   size: 25.sp,
                              //   color: ColorManager.mainWhite,
                              // ),
                              enabled: false,
                              readOnly: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 4.h),
                              backgroundColor: ColorManager.mainAccent,
                              hintText: DateFormat('yyyy-MM-dd')
                                  .format(DateTime.now()),
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
                            _showDatePickerTo(context);
                          },
                          child: IntrinsicHeight(
                            child: AppFormTextField(
                              controller: context
                                  .read<GetStoresCubit>()
                                  .dateToController,
                              // suffixIcon: Icon(
                              //   Icons.calendar_month,
                              //   size: 30.sp,
                              //   color: ColorManager.mainWhite,
                              // ),
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
                              },
                            ),
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
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: FittedBox(
                        child: Text(
                          'يومية المخزون',
                          style: TextStyles.bodyMediumLight(context),
                        ),
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
          child: RefreshIndicator(
            onRefresh: () async => _getInitialData(context, _dateFrom, _dateTo),
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
                        child: Center(
                          child: Text('إسم الصنف',
                              style: TextStyles.bodyLargeLight(context)
                                  .copyWith(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('مبيع',
                              style:
                                  TextStyles.bodyLargeLight(context).copyWith(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('رصيد',
                              style:
                                  TextStyles.bodyLargeLight(context).copyWith(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ]),
                  ],
                ),
                BlocBuilder(
                  bloc: context.read<StoreitemsCubit>(),
                  builder: (context, state) => state == StoreItemsStateLoading
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
                            2: FlexColumnWidth(3),
                          },
                          children: List.generate(
                              StoreitemsCubit.itemsList.length, (index) {
                            return TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                      StoreitemsCubit.itemsList[index]
                                              ["NameMontag"]
                                          .toString(),
                                      style: TextStyles.bodyMediumLight(context)
                                          .copyWith(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Text(
                                      StoreitemsCubit.itemsList[index]
                                              ["QuntetyMpeat"]
                                          .toString(),
                                      style: TextStyles.bodyMediumLight(context)
                                          .copyWith(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                      StoreitemsCubit.itemsList[index]["Rased"]
                                          .toString(),
                                      style: TextStyles.bodyMediumLight(context)
                                          .copyWith(
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                            ]);
                          }),
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _getInitialData(
      BuildContext context, String dateFrom, String dateTo) async {
    //MainClass.getPrefsValues();
    //dateFrom == dateTo) {
    //}
    var prefs = await SharedPreferences.getInstance();
    context.read<StoreitemsCubit>().emitStoreStates(
          HarketMakhzanRequestBody(
            date1: dateFrom,
            date2: dateTo,
            id_mosam: int.parse(prefs.getString('h2m_idMosam') == null ||
                    prefs.getString('h2m_idMosam') == ""
                ? '1'
                : prefs.getString('h2m_idMosam')!),
            id_mkzan: int.parse(prefs.getString('h2m_idMakhzan') == null ||
                    prefs.getString('h2m_idMakhzan') == ""
                ? '1'
                : prefs.getString('h2m_idMakhzan')!),
            id_frea_shrka: int.parse(
                prefs.getString('h2m_idFreaShrka') == null ||
                        prefs.getString('h2m_idFreaShrka') == ""
                    ? '1'
                    : prefs.getString('h2m_idFreaShrka')!),
          ),
        );
    print('itemsList >>>>>>${StoreitemsCubit.itemsList}');
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
                      getStores();
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
        context.read<GetStoresCubit>().dateFromController.text = _dateFrom;
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
        context.read<GetStoresCubit>().dateToController.text = _dateTo;
      });
    }
  }

  Widget BranchDialogItemCard(
      {required branch, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: ColorManager.mainAccent,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            branch["NameShrka"].toString(),
            style: TextStyles.bodyLargeLight(context),
          ),
        ),
      ),
    );
  }
}
