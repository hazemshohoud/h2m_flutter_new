import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../core/Theming/colors.dart';
import '../../../../../core/Theming/styles.dart';

class CustomerReportitemCard extends StatelessWidget {
  final reportItem;
  final index;
  const CustomerReportitemCard(
      {super.key, required this.reportItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: IntrinsicHeight(
        child: Container(
          width: double.infinity.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                ColorManager.darkAccent,
                ColorManager.darkAccent,
                ColorManager.mainAccent,
                ColorManager.mainColor,
                ColorManager.mainWhite,
              ],
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reportItem["wasf_harka"].toString(),
                            style: TextStyles.bodyMediumLight(context),
                          ),
                          Text(
                            'بتـاريخ :${DateFormat('yyyy-MM-dd').format(DateTime.parse(reportItem["date_hrka"].toString()))} \n'
                                    'إجمالي :${reportItem["egmaley"].toString()} ج.م \n' +
                                'مرتـجع :${reportItem["mortga"].toString()} جنيه \n' +
                                'تحصيل :${reportItem["mohsal"].toString()} جنيه \n' +
                                'ســداد :${reportItem["mosdad"].toString()} جنيه',
                            style: TextStyles.bodySmallLight(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Text(
                //       index.toString(),
                //       style: TextStyles.bodyMediumLight(context).copyWith(
                //         color: Colors.transparent,
                //       ),
                //     ),
                //     InkWell(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.delete,
                //           color: ColorManager.darkAccent,
                //           size: 45.sp,
                //         )),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
