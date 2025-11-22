import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/wedgits/app_text_button.dart';
import 'package:h2m_destrib/features/Home/UI/widgets/item_card.dart';
import 'package:h2m_destrib/features/pages/sales/items/logic/cubit/get_items_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/Theming/colors.dart';
import '../../../../core/Theming/styles.dart';

class ItemsListview extends StatefulWidget {
  const ItemsListview({super.key});

  @override
  State<ItemsListview> createState() => _ItemsListviewState();
}

class _ItemsListviewState extends State<ItemsListview> {
  int _perpage = 10;
  List<dynamic> itemsList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getItems(10);
  }

  @override
  Widget build(BuildContext context) {
    if (itemsList.isEmpty) {
      getItems(_perpage);
    }
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.w,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
            ),
            scrollDirection: Axis.vertical,
            itemCount: itemsList == [] ? 0 : itemsList.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemCard(
                item: itemsList[index],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
          child: AppTextButton(
            backgroundColor: ColorManager.darkAccent,
            onPressed: () {
              itemsList = [];
              _perpage += 10;
              setState(() {
                // Load more items when the user taps on "عرض المزيد"
              });
            },
            buttonText: 'عرض المزيد',
            textStyle: TextStyles.titleMediumLight(context),
          ),
        )
      ],
    );
  }

  void getItems(int perPage) async {
    var prefs = await SharedPreferences.getInstance();
    int idMosam = int.parse(prefs.getString("h2m_idMosam") ??
        "1"); // prefs.getInt("h2m_idMosam") ?? 1;
    int idMakhzan = int.parse(prefs.getString("h2m_idMakhzan") ??
        "1"); // prefs.setString("h2m_idMakhzan") ?? "1";
    String average = prefs.getString("h2m_avergSerSHra") == null ||
            prefs.getString("h2m_avergSerSHra") == ""
        ? "yes"
        : prefs.getString("h2m_avergSerSHra")!;
    context
        .read<ItemsCubit>()
        .getItemsList(average, "", perPage, idMosam, idMakhzan)
        .then((value) {
      setState(() {
        itemsList = value;
      });
    });
  }
}
