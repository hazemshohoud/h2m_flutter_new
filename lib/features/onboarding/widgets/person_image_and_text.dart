import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/Theming/styles.dart';

class PersonImageAndtext extends StatelessWidget {
  const PersonImageAndtext({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          image: AssetImage('assets/images/hazemLogo.png'),
          //height: 80.h, width: 80.w,
          fit: BoxFit.fill,
          opacity: AlwaysStoppedAnimation(.2),
        ),
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.white, Colors.white.withOpacity(0.0)],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            stops: const [0.3, 0.9],
          )),
          height: MediaQuery.of(context).size.height * .70.h,
          width: MediaQuery.of(context).size.width * .75.w,
          child: const Image(
            image: AssetImage('assets/images/person.png'),
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 20.h,
          left: 0,
          right: 0,
          child: Text('H2M\nتطبيق شركات التجارة و التوزيع',
              style: TextStyles.headlineMediumDark(context), textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
