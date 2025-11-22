import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DestribLogoAndName extends StatelessWidget {
  const DestribLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage('assets/images/hazemLogo.png'),
      height: 120.h, width: 150.w,
      fit: BoxFit.fill,
      //opacity: AlwaysStoppedAnimation(.5),
    );
  }
}
