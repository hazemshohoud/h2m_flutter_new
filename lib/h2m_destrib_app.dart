import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/Routing/app_router.dart';
import 'package:h2m_destrib/core/Routing/routes.dart';
import 'package:h2m_destrib/core/Theming/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class H2mDestrib extends StatelessWidget {
  final AppRouter appRouter;
  const H2mDestrib({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar", "EG"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: const Locale("ar", "EG"),
        title: 'H2M Destrib',
        theme: ThemeData(
          primaryColor: ColorManager.mainColor,
          scaffoldBackgroundColor: ColorManager.mainWhite,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onboardingScreen,
        onGenerateRoute: appRouter.onGenerateRoute,
       
      ),
    );
  }
}
