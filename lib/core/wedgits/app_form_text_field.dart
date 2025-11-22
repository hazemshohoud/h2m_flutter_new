import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/Theming/colors.dart';
import 'package:h2m_destrib/core/Theming/styles.dart';

class AppFormTextField extends StatelessWidget {
  final bool? autoFocus;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? textStyle;
  final bool? isObscureText;
  final String? hintText;
  final Color? backgroundColor;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String?) validator;
  final Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? labelText;
  final bool? readOnly;
  final bool? enabled;
  const AppFormTextField({
    super.key,
    this.contentPadding,
    this.labelText,
    this.focusedBorder,
    this.enabledBorder,
    this.textStyle,
    this.isObscureText,
    this.suffixIcon,
    required this.hintText,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.textAlignVertical,
    this.textAlign,
    this.onChanged,
    this.readOnly,
    this.autoFocus,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        (labelText != null)
            ? Text(
                labelText!,
                style: TextStyles.bodySmallDark(context),
              )
            : SizedBox.shrink(),
        TextFormField(
          enabled: enabled ?? true,
          readOnly: readOnly ?? false,
          autofocus: autoFocus ?? false,
          onChanged: onChanged,
          textAlign: textAlign ?? TextAlign.start,
          textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType ?? TextInputType.text,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.mainAccent, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            hintText: hintText,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: ColorManager.mainColor, width: 1.0),
                    borderRadius: BorderRadius.circular(25)),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: ColorManager.mainColor, width: 1.0),
                    borderRadius: BorderRadius.circular(25)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.red, width: 1.5)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.red, width: 1.5)),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:
                  const BorderSide(color: Colors.transparent, width: 1.0),
            ),
            filled: true,
            fillColor: backgroundColor ?? ColorManager.moreLightGrey,
            hintStyle: textStyle ?? TextStyles.headlineSmallDark(context),
            suffixIcon: suffixIcon,
          ),
          obscureText: isObscureText ?? false,
          style: textStyle ?? TextStyles.titleMediumDark(context),
          controller: controller,
          validator: (value) {
            return validator(value);
          },
        ),
      ],
    );
  }
}
