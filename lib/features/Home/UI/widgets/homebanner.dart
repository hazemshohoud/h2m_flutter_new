import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/Theming/colors.dart';
import 'package:h2m_destrib/core/Theming/styles.dart';

import '../../../../core/helpers/spacing.dart';

class HomeBanner extends StatelessWidget {
  final int currIndex;
  const HomeBanner({super.key, required this.currIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
              width: double.infinity.w,
              height: 165.h,
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    ColorManager.mainAccent,
                    ColorManager.mainAccent,
                    ColorManager.mainColor,
                    ColorManager.mainWhite,
                  ],
                ),
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'H2M دائما فى خدمتكم',
                      style: TextStyles.bodyLargeLight(context),
                    ),
                    Text(
                      'للدعم الفنى أو الشكاوى و \nالمقترحات تواصل معنا',
                      style: TextStyles.bodySmallLight(context),
                    ),
                    spacingVertical(6),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 2.5,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 0.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            '01090585287',
                            style: TextStyles.titleMediumDark(context),
                          )),
                    )
                  ])),
          Positioned(
              left: currIndex == 3 ? -30.w : 5.w,
              top: currIndex == 0
                  ? -60.h
                  : currIndex == 3
                      ? -50.h
                      : -15.h,
              child: Image.asset(
                currIndex == 2
                    ? 'assets/images/moneyCollect.png'
                    : currIndex == 1
                        ? 'assets/images/person.png'
                        : currIndex == 3
                            ? 'assets/images/customer.png'
                            : 'assets/images/storeLoading.png',
                fit: BoxFit.fill,
                height: currIndex == 0
                    ? 265.h
                    : currIndex == 3
                        ? 280.h
                        : 220.h,
                width: currIndex == 2
                    ? 180.w
                    : currIndex == 3
                        ? 200.w
                        : 150.w,
              ))
        ],
      ),
    );
  }
}
