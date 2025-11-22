import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/Theming/colors.dart';

import '../../../../../core/Theming/styles.dart';
class PaymentsItemCard extends StatelessWidget {
  const PaymentsItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      height: 120.h,
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            const Card(
                clipBehavior: Clip.antiAlias,
                semanticContainer: true,
                margin: EdgeInsets.fromLTRB(20, 8, 0, 8),
                elevation: 2.0,
                color: ColorManager.mainAccent,
                child: SizedBox(
                    width: 100,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('العميل'),
                      ],
                    ))),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('التاريخ :12/12/2022',
                      style: TextStyles.bodySmallLight(context)),
                  Text('مسدد :200.00ج.م',
                      style: TextStyles.bodySmallDark(context)),
                  Expanded(
                    child: Text('باقي :20000.00ج.م',
                        style: TextStyles.bodySmallDark(context)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
