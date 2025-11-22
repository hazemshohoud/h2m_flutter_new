import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Theming/styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/wedgits/app_form_text_field.dart';
import '../../logic/cubit/login_cubit.dart';

class UsernameAndPassword extends StatefulWidget {
  const UsernameAndPassword({super.key});

  @override
  State<UsernameAndPassword> createState() => _UsernameAndPasswordState();
}

class _UsernameAndPasswordState extends State<UsernameAndPassword> {
  bool isObscureText = true;

  final bool _isVisible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppFormTextField(
            textStyle: TextStyles.bodyLargeDark(context),
            controller: context.read<LoginCubit>().usernameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "إسم المستخدم مطلوب";
              }
              return null;
            },
            suffixIcon: const Icon(Icons.person_outline),
            hintText: 'إسم المستخدم',
          ),
          spacingVertical(16),
          AppFormTextField(
            textStyle: TextStyles.bodyLargeDark(context),
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "كلمة المرور مطلوبة";
              }
              return null;
            },
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child:
                  Icon(isObscureText ? Icons.visibility_off : Icons.visibility),
            ),
            hintText: 'أدخل كلمة المرور',
            isObscureText: isObscureText,
          )
        ],
      ),
    );
  }
}
