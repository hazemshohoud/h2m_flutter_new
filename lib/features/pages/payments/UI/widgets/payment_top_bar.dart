import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Theming/styles.dart';
import '../../../../login/logic/cubit/login_cubit.dart';

class PaymentTopBar extends StatelessWidget {
  const PaymentTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مرحبا ${context.read<LoginCubit>().mandoubName ?? 'اسم المندوب'}',
              style: TextStyles.headlineSmallLight(context),
            ),
            Text(
              'حركة التحصيل',
              style: TextStyles.bodyMediumLight(context),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
