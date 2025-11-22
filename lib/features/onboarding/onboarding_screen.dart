import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/Routing/routes.dart';
// ignore: unused_import
import 'package:h2m_destrib/core/Theming/colors.dart';
import 'package:h2m_destrib/core/Theming/styles.dart';
import 'package:h2m_destrib/core/helpers/mainclass.dart';
import 'package:h2m_destrib/features/onboarding/widgets/destrib_logo_and_name.dart';
import 'package:h2m_destrib/features/onboarding/widgets/person_image_and_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((val) {
      // Your logic here
      Navigator.pushReplacementNamed(context, Routes.loginScreen);
    });
    //_getLogedIn(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: SizedBox(
            width: double.infinity.w,
            child: SingleChildScrollView(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const DestribLogoAndName(),
                SizedBox(
                    height: MediaQuery.of(context).size.height * .65.h,
                    child: const PersonImageAndtext()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () => MainClass.clearCache(),
                        child: Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              text:
                                  'لطلب السخة الخاصة بشركتكم برجاء الاتصال على خدمة المبيعات ',
                              children: [
                                TextSpan(
                                    text: '01090585287',
                                    style:
                                        TextStyles.headlineMediumDark(context)),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      //GetStartedButton(),
                      //const LoginBlockListenner(),
                    ],
                  ),
                )
              ],
            )),
          ),
        )),
      ),
    );
  }

  // Future<void> _getLogedIn(BuildContext context) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (prefs.getString('h2m_user_name') != null) {
  //     context.read<LoginCubit>().emitLoginStates(LoginRequestBody(
  //           user_namee: prefs.getString('h2m_user_name') ?? '',
  //           passwordText: prefs.getString('h2m_password') ?? '',
  //         ));
  //   }
  //   //String path = prefs.getString('h2m_path') ?? '';
  //   //if (prefs.getString('h2m_user_id') != null) {
  //   //ApiConstants.apiBaseUrl = prefs.getString('h2m_path') ?? 'https://h2m.runasp.net/';

  //   //  return true;
  //   // } else {
  //   //   return false;
  //   // }
  // }
}
