import 'package:flutter/material.dart';
import 'package:h2m_destrib/core/Theming/colors.dart';

class TextStyles {
  static TextStyle headlineLargeLight(BuildContext context) => Theme.of(context)
      .textTheme
      .headlineLarge!
      .copyWith(color: ColorManager.mainWhite, fontWeight: FontWeight.bold);

  static TextStyle headlineMediumLight(BuildContext context) =>
      Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(color: ColorManager.mainWhite, fontWeight: FontWeight.bold);

  static TextStyle headlineSmallLight(BuildContext context) => Theme.of(context)
      .textTheme
      .headlineSmall!
      .copyWith(color: ColorManager.mainWhite, fontWeight: FontWeight.bold);

  static TextStyle headlineLargeDark(BuildContext context) => Theme.of(context)
      .textTheme
      .headlineLarge!
      .copyWith(color: ColorManager.mainAccent, fontWeight: FontWeight.bold);

  static TextStyle headlineMediumDark(BuildContext context) => Theme.of(context)
      .textTheme
      .headlineMedium!
      .copyWith(color: ColorManager.mainAccent, fontWeight: FontWeight.bold);

  static TextStyle headlineSmallDark(BuildContext context) => Theme.of(context)
      .textTheme
      .headlineSmall!
      .copyWith(color: ColorManager.mainAccent, fontWeight: FontWeight.bold);

  static TextStyle titleLargeLight(BuildContext context) => Theme.of(context)
      .textTheme
      .titleLarge!
      .copyWith(color: ColorManager.mainWhite, fontWeight: FontWeight.bold);

  static TextStyle titleLargeDark(BuildContext context) => Theme.of(context)
      .textTheme
      .titleLarge!
      .copyWith(color: ColorManager.mainAccent, fontWeight: FontWeight.bold);
  static TextStyle titleMediumLight(BuildContext context) => Theme.of(context)
      .textTheme
      .titleMedium!
      .copyWith(color: ColorManager.mainWhite, fontWeight: FontWeight.bold);

  static TextStyle titleMediumDark(BuildContext context) => Theme.of(context)
      .textTheme
      .titleMedium!
      .copyWith(color: ColorManager.mainAccent, fontWeight: FontWeight.bold);
  static TextStyle titleSmallLight(BuildContext context) => Theme.of(context)
      .textTheme
      .titleSmall!
      .copyWith(color: ColorManager.mainWhite, fontWeight: FontWeight.bold);
  static TextStyle titleSmallDark(BuildContext context) => Theme.of(context)
      .textTheme
      .titleSmall!
      .copyWith(color: ColorManager.mainAccent, fontWeight: FontWeight.bold);

  static TextStyle bodyLargeLight(BuildContext context) => Theme.of(context)
      .textTheme
      .bodyLarge!
      .copyWith(color: ColorManager.mainWhite, fontWeight: FontWeight.bold);

  static TextStyle bodyLargeDark(BuildContext context) => Theme.of(context)
      .textTheme
      .bodyLarge!
      .copyWith(color: ColorManager.mainAccent, fontWeight: FontWeight.bold);
  static TextStyle bodyMediumLight(BuildContext context) => Theme.of(context)
      .textTheme
      .bodyMedium!
      .copyWith(color: ColorManager.mainWhite, fontWeight: FontWeight.bold);

  static TextStyle bodyMediumDark(BuildContext context) => Theme.of(context)
      .textTheme
      .bodyMedium!
      .copyWith(color: ColorManager.mainAccent, fontWeight: FontWeight.bold);
  static TextStyle bodySmallLight(BuildContext context) => Theme.of(context)
      .textTheme
      .bodySmall!
      .copyWith(color: ColorManager.mainWhite, fontWeight: FontWeight.bold);
  static TextStyle bodySmallDark(BuildContext context) => Theme.of(context)
      .textTheme
      .bodySmall!
      .copyWith(color: ColorManager.mainAccent, fontWeight: FontWeight.bold);
}
