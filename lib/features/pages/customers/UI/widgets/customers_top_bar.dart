import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Theming/colors.dart';
import '../../../../../core/Theming/styles.dart';
import '../../../../../core/helpers/mainclass.dart';
import '../../../../login/logic/cubit/login_cubit.dart';

class CustomersTopBar extends StatelessWidget {
  const CustomersTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مرحبا ${(MainClass.h2m_isAdmin) ? MainClass.userName : context.read<LoginCubit>().mandoubName ?? 'اسم المندوب'}',
              style: TextStyles.headlineSmallLight(context),
            ),
            Text(
              'بيانات العملاء',
              style: TextStyles.titleMediumLight(context),
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const CircleAvatar(
            backgroundColor: ColorManager.mainAccent,
            child: Icon(
              Icons.arrow_forward,
              color: ColorManager.mainWhite,
            ),
          ),
        )
      ],
    );
  }
}
