import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/helpers/mainclass.dart';
import 'package:h2m_destrib/core/wedgits/app_form_text_field.dart';
import 'package:h2m_destrib/features/pages/sales/items/logic/cubit/get_items_cubit.dart';
import 'package:h2m_destrib/features/pages/sales/orders/UI/widgets/order_add_block_listener.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/add_models/add_edda_request_body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/details_models/order_details_requet_body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/add_models/orders_add_request_body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/logic/cubit/order_add_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/Debendncy injection/debendncy_injection.dart';
import '../../../../../core/Theming/colors.dart';
import '../../../../../core/Theming/styles.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/wedgits/app_text_button.dart';
import '../../../customers/logic/cubit/customers_cubit.dart';

class OrdersEditPage extends StatefulWidget {
  const OrdersEditPage({super.key});

  @override
  State<OrdersEditPage> createState() => _OrdersEditPageState();
}

class _OrdersEditPageState extends State<OrdersEditPage> {
  final _orderFormKey = GlobalKey<FormState>();

  int id_order = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorManager.mainColor,
      appBar: AppBar(
        title: Text('تسجيل مبيعات', style: TextStyles.titleLargeLight(context)),
        centerTitle: true,
        backgroundColor: ColorManager.mainColor,
        elevation: 3,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: ColorManager.darkAccent),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Form(
            key: _orderFormKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50.h,
                        child: Center(
                          child: Text(
                            'إسـم العميـل : ',
                            style: TextStyles.titleLargeLight(context),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: ColorManager.mainAccent,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: InkWell(
                            onTap: () async {
                              if (await MainClass.checkShift(context)) {
                                _showCustDialog(context);
                                _countBillTotals();
                              } else {
                                MainClass.showMessageDialog(context, 'تنبيه',
                                    'برجاء التاكد من فتح وردية', 0);
                              }
                            },
                            child: Center(
                                child: FittedBox(
                              child: Text(
                                OrdersAddCubit.currCustName,
                                style: TextStyles.titleLargeLight(context),
                              ),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  spacingVertical(8),
                  Container(
                    decoration: BoxDecoration(
                        color: ColorManager.mainAccent,
                        borderRadius: BorderRadius.all(Radius.circular(16.r))),
                    child: Column(
                      children: [
                        Table(
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
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    MainClass.checkShift(context).then((value) {
                                      if (OrdersAddCubit.currCustName !=
                                          'حدد العميل') {
                                        // jkhkhj
                                        if (value) {
                                          _showItemDialog(context);
                                          setState(() {});
                                        } else {
                                          MainClass.showMessageDialog(
                                              context,
                                              'المبيعات',
                                              'يرجى التأكد من فتح وردية',
                                              0);
                                        }
                                      } else {
                                        MainClass.showMessageDialog(context,
                                            'المبيعات', 'يرجى تحديد العميل', 0);
                                      }
                                    });
                                  },
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: FittedBox(
                                              child: Text(
                                            'إضغط للإضافة',
                                            style: TextStyles.titleSmallLight(
                                                context),
                                          )),
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
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: Text('كمية',
                                      style:
                                          TextStyles.titleMediumLight(context)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text('إجمالي',
                                      style:
                                          TextStyles.titleMediumLight(context)),
                                ),
                              ),
                            ]),
                          ],
                        ),
                        Table(
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
                          children: [
                            for (var item in OrdersAddCubit.itemsList)
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              item.name_montag.toString(),
                                              style: TextStyles.bodyMediumLight(
                                                  context),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  OrdersAddCubit.itemsList
                                                      .remove(item);
                                                  _countBillTotals();
                                                });
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                size: 25.sp,
                                                color: ColorManager.darkAccent,
                                              ))
                                        ],
                                      ),
                                      FittedBox(
                                        child: Text(
                                            'سعر: ${item.price}  خصم: ${item.discount}',
                                            style: TextStyles.bodyMediumLight(
                                                context)),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    item.qunttey.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyles.bodyMediumLight(context),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    item.total_amount.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyles.bodyMediumLight(context),
                                  ),
                                )
                              ])
                            //OrdersAddCubit.itemsList.map((item) { return TableRow(children: [ Padding( padding: const EdgeInsets.all(8.0), child: Text(item['name']), ), Padding( padding: const EdgeInsets.all(8.0), child: Text(item['quantity'].toString()), ), Padding( padding: const EdgeInsets.all(8.0), child: Text(item['price'].toString()), ), ]); }).toList(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //OrdersAddCubit.itemsList.map((item) { return TableRow(children: [ Padding( padding: const EdgeInsets.all(8.0), child: Text(item['name']), ), Padding( padding: const EdgeInsets.all(8.0), child: Text(item['quantity'].toString()), ), Padding( padding: const EdgeInsets.all(8.0), child: Text(item['price'].toString()), ), ]); }).toList(),

                  spacingVertical(8),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Text(
                          'إجمالي :',
                          style: TextStyles.bodyMediumLight(context),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorManager.mainAccent,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: AppFormTextField(
                              enabledBorder: InputBorder.none,
                              readOnly: true,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              textStyle: TextStyles.bodySmallLight(context),
                              onChanged: (value) {
                                setState(() {
                                  _countBillTotals();
                                });
                              },
                              controller:
                                  OrdersAddCubit.egmaley_fatoraController,
                              backgroundColor: Colors.transparent,
                              hintText: '0.0',
                              validator: (value) {},
                            ),
                          ),
                        ),
                        Text(
                          'خصم :',
                          style: TextStyles.bodyMediumLight(context),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorManager.mainAccent,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                                child: AppFormTextField(
                              enabledBorder: InputBorder.none,

                              //readOnly: true,
                              textStyle: TextStyles.bodySmallLight(context),
                              onChanged: (value) {
                                _countBillTotals();
                              },
                              textAlign: TextAlign.center,
                              //keyboardType: TextInputType.number,
                              controller: OrdersAddCubit.billDiscountController,
                              backgroundColor: Colors.transparent,
                              hintText: '0.0',
                              validator: (value) {},
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  spacingVertical(8),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Text(
                          'صــافي :',
                          style: TextStyles.bodyMediumLight(context),
                        ),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                color: ColorManager.mainAccent,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: AppFormTextField(
                                enabledBorder: InputBorder.none,
                                readOnly: true,
                                onChanged: (value) {
                                  _countBillTotals();
                                },
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10.h),
                                textStyle: TextStyles.bodySmallLight(context),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                controller: OrdersAddCubit.billNetController,
                                backgroundColor: Colors.transparent,
                                hintText: '0.0',
                                validator: (value) {},
                              )),
                        ),
                        Text(
                          'نقدي :',
                          style: TextStyles.bodyMediumLight(context),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorManager.mainAccent,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: AppFormTextField(
                              enabledBorder: InputBorder.none,

                              //readOnly: true,
                              textStyle: TextStyles.bodySmallLight(context),
                              onChanged: (value) {
                                _countBillTotals();
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: OrdersAddCubit.billPaiedController,
                              backgroundColor: ColorManager.mainAccent,
                              hintText: '0.0',
                              validator: (value) {
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  spacingVertical(8),
                  IntrinsicHeight(
                    child: SizedBox(
                      child: Row(
                        children: [
                          Text(
                            'رصيـــد :',
                            style: TextStyles.bodyMediumLight(context),
                          ),
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  color: ColorManager.mainAccent,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: AppFormTextField(
                                  enabledBorder: InputBorder.none,
                                  onChanged: (value) {
                                    _countBillTotals();
                                  },
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.h),
                                  textStyle: TextStyles.bodySmallLight(context),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller:
                                      OrdersAddCubit.custOldDebitController,
                                  backgroundColor: Colors.transparent,
                                  hintText: '0.0',
                                  validator: (value) {},
                                )),
                          ),
                          Text(
                            'آجـل :',
                            style: TextStyles.bodyMediumLight(context),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorManager.mainAccent,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: AppFormTextField(
                                enabledBorder: InputBorder.none,
                                onChanged: (p0) => _countBillTotals(),
                                readOnly: true,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10.h),
                                textStyle: TextStyles.bodySmallLight(context),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                controller: OrdersAddCubit.billRemainController,
                                backgroundColor: ColorManager.mainAccent,
                                hintText: '0.0',
                                validator: (value) {
                                  value ?? '0.0';
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  spacingVertical(8),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        FittedBox(
                          child: Text(
                            'إجمالي المـديونية حتى تاريخه :',
                            style: TextStyles.bodyMediumLight(context),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorManager.mainAccent,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                                child: AppFormTextField(
                              enabledBorder: InputBorder.none,
                              readOnly: true,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10.h),
                              textStyle: TextStyles.bodySmallLight(context),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: OrdersAddCubit
                                  .totCustAccountTillNowController,
                              backgroundColor: ColorManager.mainAccent,
                              hintText: '0.0',
                              validator: (value) {
                                value ?? '0.0';
                              },
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  spacingVertical(16),
                  AppTextButton(
                      backgroundColor: ColorManager.mainAccent,
                      buttonText: 'حفــظ الفاتورة',
                      textStyle: TextStyles.titleSmallLight(context),
                      onPressed: () {
                        if (OrdersAddCubit.itemsList.isNotEmpty) {
                          if (OrdersAddCubit.currCustId > 0) {
                            if (double.parse(
                                    OrdersAddCubit.billPaiedController.text) >
                                0) {
                              if (_orderFormKey.currentState!.validate()) {
                                _addOrder(context);
                              }
                            } else {
                              MainClass.showMessageDialog(
                                context,
                                'المبيعات',
                                'يرجى تحديد قيمة المسدد',
                                0,
                              );
                            }
                          } else {
                            MainClass.showMessageDialog(
                                context, 'المبيعات', 'يرجى تحديد العميل', 0);
                          }
                        } else {
                          MainClass.showMessageDialog(
                              context, 'المبيعات', 'يرجى تسجيل المنتجات', 0);
                        }
                      }),
                  const OrderAddBlockListener()
                ]),
          ),
        ),
      ),
    ));
  }

  void _showCustDialog(BuildContext context) {
    List<dynamic> customersList = context.read<CustomersCubit>().customersList;
    int itemCount = customersList.length;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          title: const Text(
            'حدد العميل',
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.height * .5,
            child: BlocBuilder<CustomersCubit, CustomersState>(
                builder: (context, state) {
              return state.whenOrNull(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                success: (customers) => ListView.builder(
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
                            setState(() {
                              OrdersAddCubit.currCustName =
                                  customers[index]["NameAMel"].toString();
                              OrdersAddCubit.currCustId =
                                  customers[index]["IdAmel"];
                              OrdersAddCubit.custOldDebitController.text =
                                  customers[index]["CreditAmel"].toString();
                              Navigator.pop(context);
                            });
                          },
                          child: ListTile(
                            title: Text(customers[index]["NameAMel"].toString(),
                                style: TextStyles.headlineSmallLight(context)),
                            leading: Text(
                              customers[index]["CreditAmel"].toString(),
                              style: TextStyles.headlineSmallLight(context),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )!;
            }),
          ),
        );
      },
    );
  }

  void _showItemDialog(BuildContext context) {
    List<dynamic> itemsList = context.read<ItemsCubit>().ItemsList;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('حدد الصنف'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.height * .5,
            child: BlocBuilder<ItemsCubit, GetItemsState>(
                bloc: getIt.get<ItemsCubit>(),
                builder: (context, state) {
                  return state.whenOrNull(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    success: (items) => ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: itemsList.length + 1,
                      itemBuilder: (context, int index) {
                        //bool _custIsChecked = false;
                        return index == itemsList.length
                            ? InkWell(
                                onTap: () {},
                                child: Center(
                                  child: Text('عرض المزيد',
                                      style:
                                          TextStyles.titleLargeDark(context)),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 8.0),
                                child: Container(
                                  height: 110.h,
                                  decoration: BoxDecoration(
                                    color: ColorManager.mainAccent,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      _showItemQtyDialog(context, items[index]);
                                    },
                                    child: ListTile(
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            items[index]["NameMontag"]
                                                .toString(),
                                            style: TextStyles.titleSmallLight(
                                                context),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'وصف: ${items[index]["WasfElsanf"].toString()}',
                                            style: TextStyles.titleSmallDark(
                                                context),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            'عبوة: ${items[index]["HagmObwa"].toString()}',
                                            style: TextStyles.titleSmallDark(
                                                context),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                      leading: FittedBox(
                                        child: Text(
                                          '${items[index]["AvargBrice"]}\nج.م',
                                          style: TextStyles.titleLargeLight(
                                              context),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      },
                    ),
                  )!;
                }),
          ),
        );
      },
    );
  }

  void _showItemQtyDialog(BuildContext context, item) {
    OrdersAddCubit.qtyController.text = '0';
    OrdersAddCubit.discountController.text = '0';
    OrdersAddCubit.totPriceController.text = '0';
    OrdersAddCubit.priceController.text = item["AvargBrice"].toString();
    OrdersAddCubit.finalTotalController.text = '0';
    OrdersAddCubit.discountPrcController.text = '0';
    _countDialogItem(item);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            actionsPadding: EdgeInsets.all(8),
            titlePadding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            title: Center(child: const Text('كمية الصنف')),
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 4.0),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 4.0),
            content: SingleChildScrollView(
              child: Form(
                key: OrdersAddCubit.itemQtyFormKey,
                child: Column(
                  children: [
                    Card(
                      elevation: 1.5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'بيانات الصنف',
                                  style: TextStyles.titleSmallDark(context),
                                ),
                              ],
                            ),
                            Divider(
                              height: 4.h,
                            ),
                            Row(
                              children: [
                                FittedBox(
                                  child: Text(
                                    'الاسم: ${item["NameMontag"].toString()}',
                                    style: TextStyles.bodySmallDark(context),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  'السعر: ${item["AvargBrice"].toString()}',
                                  style: TextStyles.bodySmallDark(context),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'وصف: ${item["WasfElsanf"].toString()}',
                                  style: TextStyles.bodySmallDark(context),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'عبوة: ${item["HagmObwa"].toString()}',
                                  style: TextStyles.bodySmallDark(context),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 1.5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(children: [
                              Text(
                                'تفاصيل البيع',
                                style: TextStyles.titleSmallDark(context),
                              ),
                              Spacer(),
                            ]),
                            Divider(
                              height: 4.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: ColorManager.mainAccent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 4.0),
                                child: Column(
                                  children: [
                                    Row(children: [
                                      Text(
                                        'الكمية',
                                        style:
                                            TextStyles.titleSmallDark(context),
                                      ),
                                    ]),
                                    Divider(
                                      height: 4.h,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                try {
                                                  if (int.parse(OrdersAddCubit
                                                          .qtyController
                                                          .text) >=
                                                      0) {
                                                    OrdersAddCubit.qtyController
                                                        .text = (int.parse(
                                                                OrdersAddCubit
                                                                    .qtyController
                                                                    .text) +
                                                            1)
                                                        .toString();
                                                  }
                                                } catch (e) {
                                                  OrdersAddCubit
                                                      .qtyController.text = '1';
                                                }
                                                _countDialogItem(item);
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                child: const Icon(
                                                  Icons.add,
                                                  size: 25,
                                                ),
                                              )),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: AppFormTextField(
                                                  textStyle:
                                                      TextStyles.bodySmallDark(
                                                          context),
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  onChanged: (value) {
                                                    _countDialogItem(item);
                                                  },
                                                  textAlign: TextAlign.center,
                                                  controller: OrdersAddCubit
                                                      .qtyController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  hintText: 'حدد الكمية',
                                                  validator: (String? value) {
                                                    if (value == null ||
                                                        value.isEmpty ||
                                                        double.parse(value
                                                                .toString()) <=
                                                            0) {
                                                      return 'يجب تحديد الكمية';
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                try {
                                                  if (OrdersAddCubit
                                                          .qtyController.text !=
                                                      '1') {
                                                    OrdersAddCubit.qtyController
                                                        .text = (int.parse(
                                                                OrdersAddCubit
                                                                    .qtyController
                                                                    .text) -
                                                            1)
                                                        .toString();
                                                  }
                                                } catch (e) {
                                                  OrdersAddCubit
                                                      .qtyController.text = '1';
                                                }
                                                _countDialogItem(item);
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                child: const Icon(
                                                  Icons.remove,
                                                  size: 20,
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: ColorManager.mainAccent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 8.0),
                                child: Column(
                                  children: [
                                    Row(children: [
                                      Text(
                                        'الخصم(%)',
                                        style:
                                            TextStyles.titleSmallDark(context),
                                      ),
                                    ]),
                                    Divider(
                                      height: 4.h,
                                    ),
                                    // discount row
                                    Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              try {
                                                if (int.parse(OrdersAddCubit
                                                        .discountPrcController
                                                        .text) >=
                                                    0) {
                                                  OrdersAddCubit
                                                      .discountPrcController
                                                      .text = (int.parse(
                                                              OrdersAddCubit
                                                                  .discountPrcController
                                                                  .text) +
                                                          1)
                                                      .toString();
                                                }
                                              } catch (e) {
                                                OrdersAddCubit
                                                    .discountPrcController
                                                    .text = '0';
                                              }
                                              _countDialogItem(item);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: const Icon(
                                                Icons.add,
                                                size: 20,
                                              ),
                                            )),
                                        Expanded(
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: AppFormTextField(
                                                    textStyle: TextStyles
                                                        .bodySmallDark(context),
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    onChanged: (value) {
                                                      _countDialogItem(item);
                                                    },
                                                    textAlign: TextAlign.center,
                                                    controller: OrdersAddCubit
                                                        .discountPrcController,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    hintText: 'حدد الخصم',
                                                    validator: (String? value) {
                                                      return null;
                                                    },
                                                  ),
                                                ))),
                                        InkWell(
                                            onTap: () {
                                              try {
                                                if (OrdersAddCubit
                                                        .discountPrcController
                                                        .text !=
                                                    '0') {
                                                  OrdersAddCubit
                                                      .discountPrcController
                                                      .text = (int.parse(
                                                              OrdersAddCubit
                                                                  .discountPrcController
                                                                  .text) -
                                                          1)
                                                      .toString();
                                                }
                                              } catch (e) {
                                                OrdersAddCubit
                                                    .discountPrcController
                                                    .text = '0';
                                              }
                                              _countDialogItem(item);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: const Icon(
                                                Icons.remove,
                                                size: 20,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 1.5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Row(children: [
                            Text('إجماليات',
                                style: TextStyles.titleSmallDark(context)),
                          ]),
                          Divider(
                            height: 4.h,
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                Text('الإجمـالي: ',
                                    style: TextStyles.titleSmallDark(context)),
                                Expanded(
                                  child: AppFormTextField(
                                    readOnly: true,
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    textStyle:
                                        TextStyles.titleSmallDark(context),
                                    textAlign: TextAlign.center,
                                    controller:
                                        OrdersAddCubit.totPriceController,
                                    keyboardType: TextInputType.number,
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'يجب تحديد الكمية';
                                      }
                                    },
                                    hintText: '',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Text('ق.الخصم: ',
                                    style: TextStyles.titleSmallDark(context)),
                                Expanded(
                                  child: AppFormTextField(
                                    readOnly: true,
                                    onChanged: (value) {
                                      _countDialogItem(item);
                                    },
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    textStyle:
                                        TextStyles.titleSmallDark(context),
                                    textAlign: TextAlign.center,
                                    controller:
                                        OrdersAddCubit.discountController,
                                    keyboardType: TextInputType.number,
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'يجب تحديد الكمية';
                                      }
                                    },
                                    hintText: '',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text('الصـــافي: ',
                                  style: TextStyles.titleSmallDark(context)),
                              Expanded(
                                child: AppFormTextField(
                                  readOnly: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 8.0),
                                  textStyle: TextStyles.titleSmallDark(context),
                                  textAlign: TextAlign.center,
                                  controller:
                                      OrdersAddCubit.finalTotalController,
                                  keyboardType: TextInputType.number,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'يجب تحديد الكمية';
                                    }
                                  },
                                  hintText: '',
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text('تأكيد'),
                    onPressed: () async {
                      if (OrdersAddCubit.itemQtyFormKey.currentState!
                          .validate()) {
                        var prefs = await SharedPreferences.getInstance();

                        OrdersDetailsRequestBody itemToAdd =
                            OrdersDetailsRequestBody(
                          id_mosam_bee:
                              int.parse(prefs.getString('h2m_idMosam') ?? '1'),
                          id_wrdya:
                              int.parse(prefs.getString('h2m_idWrdya') ?? '1'),
                          id_ordars: id_order,
                          id_montag: item["Id_Montag"],
                          mkhzan: item["NameMghzan"],
                          note: 'مبيعات',
                          ser_shra: item["ser_shra"] ?? 0.0,
                          total_amount: double.parse(
                              OrdersAddCubit.finalTotalController.text),
                          id_mkzan:
                              int.parse(prefs.getString('h2m_idMkzan') ?? '1'),
                          id_frea_shrka: int.parse(
                              prefs.getString('h2m_idFreaShrka') ?? '1'),
                          discount: double.parse(
                              OrdersAddCubit.discountController.text),
                          name_montag: item["NameMontag"],
                          price:
                              double.parse(OrdersAddCubit.priceController.text),
                          qunttey:
                              double.parse(OrdersAddCubit.qtyController.text),
                          amount: double.parse(
                              OrdersAddCubit.totPriceController.text),
                          date_hrka: DateTime.now().toString(),
                          id_edaa: item["IdEdaa"],
                          id_khdma: item["NowKhdm"],
                          montg_tsne: item["MontagTsnee"],
                        );

                        OrdersAddCubit.itemsList.add(itemToAdd);

                        double seraaTot = double.parse(
                            OrdersAddCubit.mblghShraController.text == ''
                                ? '0.0'
                                : OrdersAddCubit.mblghShraController.text);
                        double itemshraa = double.parse(
                            item["ser_shra"].toString() == 'null'
                                ? '0.0'
                                : item["ser_shra"].toString());
                        OrdersAddCubit.mblghShraController.text =
                            (seraaTot + itemshraa).toString();
                        print(
                            'sheraaTot: ${OrdersAddCubit.mblghShraController.text}');
                        setState(() {
                          _countBillTotals();
                        });
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ]);
      },
    );
  }

  void _countDialogItem(item) {
    try {
      OrdersAddCubit.totPriceController.text =
          (double.parse(OrdersAddCubit.qtyController.text) *
                  double.parse(item["AvargBrice"].toString()))
              .toString();

      OrdersAddCubit.discountController.text =
          (double.parse(OrdersAddCubit.totPriceController.text) *
                  double.parse(OrdersAddCubit.discountPrcController.text) /
                  100)
              .toString();
      OrdersAddCubit.finalTotalController.text =
          (double.parse(OrdersAddCubit.totPriceController.text) -
                  double.parse(OrdersAddCubit.discountController.text))
              .toString();
    } catch (e) {
      OrdersAddCubit.totPriceController.text = '0';
    }
  }

  void _countBillTotals() {
    double tot = 0.0;
    OrdersAddCubit.egmaley_fatoraController.text = '0.0';
    OrdersAddCubit.billRemainController.text = '0.0';
    OrdersAddCubit.totCustAccountTillNowController.text = '0.0';
    //OrdersAddCubit.billDiscountController.text = '0.0';
    try {
      for (var element in OrdersAddCubit.itemsList) {
        tot += double.parse(element.total_amount.toString());
      }
      OrdersAddCubit.egmaley_fatoraController.text = tot.toStringAsFixed(2);
      OrdersAddCubit.billNetController.text =
          (double.parse(OrdersAddCubit.egmaley_fatoraController.text) -
                  double.parse(OrdersAddCubit.billDiscountController.text))
              .toStringAsFixed(2);
      OrdersAddCubit.billRemainController.text =
          (double.parse(OrdersAddCubit.billNetController.text) -
                  double.parse(OrdersAddCubit.billPaiedController.text))
              .toStringAsFixed(2);
      OrdersAddCubit.totCustAccountTillNowController.text =
          (double.parse(OrdersAddCubit.billRemainController.text) +
                  double.parse(OrdersAddCubit.custOldDebitController.text))
              .toStringAsFixed(2);
    } catch (e) {
      OrdersAddCubit.totPriceController.text = '0';
    }
  }

  void _addOrder(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(' idFreaShrka: >>>>>>>>>>>> ${prefs.getString('h2m_idFreaShrka')}');
    if (await MainClass.checkShift(context)) {
      //int hraketAmel = 0;
      //int idFreaShrka = 0;
      // prefs.getString('h2m_idFreaShrka') != null
      //     ? idFreaShrka = int.parse(prefs.getString('h2m_idFreaShrka')!)
      //     : idFreaShrka = -1;

      // context
      //     .read<OrdersAddCubit>()
      //     .getHraketAmel(GetHraketAmelRequestBody())
      //     .then(
      //   (value) {
      //     hraketAmel = value;
      //   },
      // );

      OrdersAddRequestBody newOrder = OrdersAddRequestBody(
          date_ordar: DateTime.now(),
          id_amel: OrdersAddCubit.currCustId,
          wasf_fatora: 'فاتورة مبيعات',
          sealse_mane: prefs.getString("h2m_user_name") ?? '',
          egmaley_fatora: OrdersAddCubit.egmaley_fatoraController.text,
          nakdey: OrdersAddCubit.billPaiedController.text,
          agel: OrdersAddCubit.billRemainController.text,
          agkhsm_nkdeyel: OrdersAddCubit.billDiscountController.text,
          safey: OrdersAddCubit.billNetController.text,
          // hraket_amel: hraketAmel,
          khdmet_twsel: '0.00',
          id_wrdya: int.parse(MainClass.idWardia),
          id_frea_shrka: int.parse(prefs.getString('h2m_idFreaShrka') ?? '1'),
          id_mosam_bee_order: int.parse(prefs.getString("h2m_idMosam")!),
          id_last_name: int.parse(prefs.getString('h2m_user_id')!),
          mplegh_shra: double.parse(OrdersAddCubit.mblghShraController.text),
          nowa_fatora: (OrdersAddCubit.billPaiedController.text ==
                  OrdersAddCubit.billNetController.text)
              ? 'نقدي'
              : 'تقسيط',
          khzna: prefs.getString("h2m_khazna") ?? '');
      await context.read<OrdersAddCubit>().SaveOrderData(newOrder).then(
        (value) {
          if (value > 0) {
            for (int elementIndex = 0;
                elementIndex < OrdersAddCubit.itemsList.length;
                elementIndex++) {
              id_order = value;
              OrdersDetailsRequestBody newOrderDetails =
                  OrdersDetailsRequestBody(
                id_montag: OrdersAddCubit.itemsList[elementIndex].id_montag,
                name_montag: OrdersAddCubit.itemsList[elementIndex].name_montag,
                id_ordars: value,
                qunttey: OrdersAddCubit.itemsList[elementIndex].qunttey,
                price: OrdersAddCubit.itemsList[elementIndex].price,
                discount: OrdersAddCubit.itemsList[elementIndex].discount,
                amount: OrdersAddCubit.itemsList[elementIndex].amount,
                total_amount:
                    OrdersAddCubit.itemsList[elementIndex].total_amount,
                note: OrdersAddCubit.itemsList[elementIndex].note,
                mkhzan: prefs.getString('h2m_makhzan') ?? '',
                ser_shra: OrdersAddCubit.itemsList[elementIndex].ser_shra,
                id_mkzan: int.parse(prefs.getString('h2m_idMakhzan') ?? ''),
                id_mosam_bee:
                    OrdersAddCubit.itemsList[elementIndex].id_mosam_bee,
                id_wrdya: int.parse(MainClass.idWardia),
                id_frea_shrka:
                    int.parse(prefs.getString('h2m_idFreaShrka') ?? '1'),
                date_hrka: DateTime.now().toString(),
                id_edaa: OrdersAddCubit.itemsList[elementIndex].id_edaa,
                id_khdma: OrdersAddCubit.itemsList[elementIndex].id_khdma,
                montg_tsne: OrdersAddCubit.itemsList[elementIndex].montg_tsne,
              );
              context
                  .read<OrdersAddCubit>()
                  .SaveOrderDetails(newOrderDetails)
                  .then((value) {
                int idEddaa = int.parse(
                    OrdersAddCubit.itemsList[elementIndex].id_edaa.toString());
                if (idEddaa > 0) {
                  context
                      .read<OrdersAddCubit>()
                      .addHarketEdda(AddEddaRequestBody(
                          date_hrka: DateTime.now().toString(),
                          id_edaa: idEddaa,
                          id_mndob: 0,
                          sader: double.parse(OrdersAddCubit
                              .itemsList[elementIndex].qunttey
                              .toString()),
                          wared: 0,
                          id_order:
                              OrdersAddCubit.itemsList[elementIndex].id_ordars,
                          twred: "yes",
                          id_mkzan: MainClass.idMakhzan,
                          id_mosam: int.parse(MainClass.idMosam),
                          byan: "بيع للعميل ${OrdersAddCubit.currCustName}"))
                      .then((value) {
                    if (elementIndex == OrdersAddCubit.itemsList.length - 1) {
                      Navigator.pop(context);
                    }
                  });
                } else {
                  if (elementIndex == OrdersAddCubit.itemsList.length - 1) {
                    Navigator.pop(context);
                  }
                }
              });
            }
          }
        },
      );
    } else {
      MainClass.showMessageDialog(
        context,
        'المبيعات',
        'يرجى التأكد من وجود وردية مفتوحة ',
        0,
      );
    }
  }
}
