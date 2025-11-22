import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/Theming/styles.dart';
import 'package:h2m_destrib/core/helpers/spacing.dart';
import 'package:h2m_destrib/core/wedgits/app_text_button.dart';
import 'package:h2m_destrib/features/login/UI/widgets/login_block_listenner.dart';
import 'package:h2m_destrib/features/login/UI/widgets/username_and_password.dart';
import 'package:h2m_destrib/features/login/data/models/login_request_body.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../logic/cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    _getLogedIn(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  spacingVertical(50),
                  Text(
                    'تسجيل الدخول',
                    style: TextStyles.headlineMediumDark(context),
                  ),
                  spacingVertical(8),
                  Text(
                    'لإتمام عملية التسجيل بنجاح برجاء التواصل مع إدارة شركتك للحصول على بيانات التسجيل الخاصة بك.',
                    style: TextStyles.titleLargeDark(context),
                    textAlign: TextAlign.center,
                  ),
                  spacingVertical(36),
                  const Column(
                    children: [UsernameAndPassword()],
                  ),
                  spacingVertical(30),
                  AppTextButton(
                      borderRadius: 20.r,
                      buttonText: 'تسجيل الدخول',
                      textStyle: TextStyles.titleMediumLight(context),
                      onPressed: () {
                        if (context
                            .read<LoginCubit>()
                            .formKey
                            .currentState!
                            .validate()) {
                          var cubit = context.read<LoginCubit>();
                          //print(cubit.passwordController.text);
                          //ApiConstants.apiBaseUrl = cubit.pathController.text;
                          context
                              .read<LoginCubit>()
                              .emitLoginStates(LoginRequestBody(
                                user_namee: cubit.usernameController.text,
                                passwordText: cubit.passwordController.text,
                              ));
                        }
                      }),
                  const LoginBlockListenner(),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  Future<void> _getLogedIn(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('h2m_user_name') != null) {
      context.read<LoginCubit>().emitLoginStates(LoginRequestBody(
            user_namee: prefs.getString('h2m_user_name') ?? '',
            passwordText: prefs.getString('h2m_password') ?? '',
          ));
    }
    //String path = prefs.getString('h2m_path') ?? '';
    //if (prefs.getString('h2m_user_id') != null) {
    //ApiConstants.apiBaseUrl = prefs.getString('h2m_path') ?? 'https://h2m.runasp.net/';

    //  return true;
    // } else {
    //   return false;
    // }
  }
}
