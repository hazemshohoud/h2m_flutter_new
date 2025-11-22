import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/Routing/routes.dart';
import 'package:h2m_destrib/core/Theming/colors.dart';
import 'package:h2m_destrib/core/Theming/styles.dart';
import 'package:h2m_destrib/core/helpers/extensions.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushReplacementNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(Size(double.infinity, 50.h)),
          backgroundColor: WidgetStateProperty.all(ColorManager.mainColor),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
          )),
      child: Text(
        'استكمال البيانات',
        style: TextStyles.bodyLargeLight(context),
      ),
    );
  }
}
