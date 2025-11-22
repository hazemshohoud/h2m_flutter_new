import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/pages/sales/orders/data/models/getdata_models/get_idwrdya_request_Body.dart';
import '../../features/pages/sales/orders/logic/cubit/order_add_cubit.dart';

class MainClass {
  static String? token;
  static String? lang;
  static String? langCode;
  static String? langName;
  static TableRow? paymentHeaderRow = TableRow(children: [
    Text("إسم العميل"),
    Text("مدفوع"),
    Text("رصيد"),
  ]);

  static int currIndex = 1;

  static String namemndob = '';

  static String idFreaShrka = '';

  static String userName = '';

  static String idKhazna = '';

  static String idMakhzan = '';

  static String lastname = '';

  static String khazna = '';

  static String makhzan = '';

  static String nameshrka = '';

  static String avergSerSHra = '';

  static String idMosam = '-1';

  static String nameMosam = '';

  static String currUserId = '';

  static String idWardia = '';

  static bool h2m_isAdmin = false;
  static String reportIdFreaShrka = '1';

  static String reportFreaShrkaName = 'حدد الفرع';

  static String reportMakhzanName = 'حدد السيارة';

  static String reportMandobnName = 'حدد المندوب';

  static String reportIdMakhzan = '';

  static int currCustomerId = -1;

  static Future<void> getPrefsValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    idMakhzan = prefs.getString('h2m_idMakhzan') ?? '1';
    idMosam = prefs.getString('h2m_idMosam') ?? '1';
    idFreaShrka = prefs.getString('h2m_idFreaShrka') ?? '1';
    userName = prefs.getString('h2m_user_name') ?? '';
  }

  static Future<bool> clearCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('h2m_idMakhzan');
    await prefs.remove('h2m_idMosam');
    await prefs.remove('h2m_idFreaShrka');
    await prefs.remove('h2m_user_name');
    await prefs.remove('h2m_path');
    await prefs.remove("h2m_namemndob");
    await prefs.remove("h2m_idFreaShrka");
    await prefs.remove("h2m_idKhazna");
    await prefs.remove("h2m_idMakhzan");
    await prefs.remove("h2m_replastname");
    await prefs.remove("h2m_khazna");
    await prefs.remove("h2m_makhzan");
    await prefs.remove("h2m_nameshrka");
    await prefs.remove("h2m_avergSerSHra");
    await prefs.remove("h2m_user_id");
    return await prefs.clear();
  }

  static Future<bool> showMessageDialog(
      BuildContext context, String title, String message, int MessageButton) {
    bool isTrue = false;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(title),
              content: FittedBox(child: Text(message)),
              actions: [
                (MessageButton == 1)
                    ? TextButton(
                        child: const Text("حسنا"),
                        onPressed: () {
                          isTrue = true;
                          Navigator.pop(context);

                          //clearCache();
                        },
                      )
                    : SizedBox(
                        height: 0,
                        width: 0,
                      ),
                TextButton(
                  child: Text((MessageButton == 1) ? "لا" : "موافق"),
                  onPressed: () {
                    isTrue = false;
                    Navigator.pop(context);
                  },
                ),
              ]);
        }).then((value) => isTrue);
  }

  static Future<bool> checkShift(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int idWardia = 0;

    await context
        .read<OrdersAddCubit>()
        .GetIdWardya(GetIdWrdyaRequestBody(
          user_id: int.parse(prefs.getString('h2m_user_id')!),
        ))
        .then((value) {
      //print('wardia >>>>>>>>>>> $value');
      MainClass.idWardia = value.toString();
      idWardia = int.parse(MainClass.idWardia);
    });
    return idWardia > 0;
  }
}
