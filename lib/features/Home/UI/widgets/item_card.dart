import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/Theming/colors.dart';
import 'package:h2m_destrib/core/Theming/styles.dart';

class ItemCard extends StatelessWidget {
  final Map<String, dynamic>? item;
  const ItemCard({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
          clipBehavior: Clip.antiAlias,
          semanticContainer: true,
          margin: const EdgeInsets.fromLTRB(20, 8, 0, 8),
          elevation: 2.0,
          color: ColorManager.mainAccent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Text(
                    '${item!["NameMontag"]}',
                    style: TextStyles.titleSmallLight(context)
                        .copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  color: ColorManager.mainWhite,
                  height: 2,
                ),
                // FittedBox(
                //   child: Text('كود :${item!["Barkode"]}',
                //       style: TextStyles.titleSmallLight(context)),
                // ),
                FittedBox(
                  child: Text('فئة :${item!["WasfElsanf"]}',
                      style: TextStyles.titleSmallLight(context)),
                ),
                // FittedBox(
                //   child: Text('الرصيد: ${item!["RasedMontag"]}',
                //       style: TextStyles.titleSmallLight(context)),
                // ),
                FittedBox(
                  child: Text('السعر: ${item!["SerBeeMontag"]} ج.م',
                      style: TextStyles.titleSmallLight(context)),
                ),
              ],
            ),
          )),
    );
  }
}
