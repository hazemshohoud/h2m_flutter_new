import 'package:flutter/material.dart';
import 'package:h2m_destrib/core/Theming/colors.dart';
import 'package:h2m_destrib/core/Theming/styles.dart';
import 'package:h2m_destrib/core/helpers/spacing.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasNumber;
  final bool hasSpecial;
  final bool hasMinLength;

  const PasswordValidations(
      {super.key,
      required this.hasUppercase,
      required this.hasLowercase,
      required this.hasNumber,
      required this.hasSpecial,
      required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      buildValidationRow(
          'يجب ان تحتوي كلمة المرور على حرف كبير وصغير ورقم ورموز',
          hasUppercase,
          context),
      spacingVertical(8),
    ]);
  }

  Widget buildValidationRow(String text, bool isValid, BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: ColorManager.mainAccent,
          radius: 2.50,
        ),
        Text(
          text,
          style: TextStyles.bodySmallLight(context).copyWith(
              decoration: isValid ? TextDecoration.lineThrough : null,
              decorationThickness: 2,
              decorationColor: Colors.green,
              color: isValid ? ColorManager.mainGrey : ColorManager.mainColor),
        )
      ],
    );
  }
}
