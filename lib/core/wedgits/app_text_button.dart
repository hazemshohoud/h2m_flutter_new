import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/Theming/colors.dart';
import 'package:h2m_destrib/core/Theming/styles.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttWidth;
  final double? buttHeight;
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  const AppTextButton(
      {super.key,
      this.borderRadius,
      this.backgroundColor,
      this.horizontalPadding,
      this.verticalPadding,
      this.buttWidth,
      this.buttHeight,
      required this.buttonText,
      required this.textStyle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 10.0,
              vertical: verticalPadding ?? 6.0),
        ),
        minimumSize: WidgetStateProperty.all(
            Size(buttWidth ?? double.infinity.w, buttHeight ?? 20.h)),
        textStyle: WidgetStateProperty.all(
            textStyle ?? TextStyles.headlineSmallLight(context)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
          ),
        ),
        backgroundColor:
            WidgetStateProperty.all(backgroundColor ?? ColorManager.mainColor),
      ),
      onPressed: () {
        onPressed!();
      },
      child: Text(
        buttonText,
        style: textStyle ?? TextStyles.headlineSmallLight(context),
      ),
    );
  }
}
