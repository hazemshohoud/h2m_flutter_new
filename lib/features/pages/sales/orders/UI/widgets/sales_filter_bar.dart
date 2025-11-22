import 'package:flutter/material.dart';

import '../../../../../../core/Theming/styles.dart';

class SalesFilterBar extends StatelessWidget {
  const SalesFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        'يومية المخزون',
        style: TextStyles.bodyMediumLight(context),
      ),
    );
  }
}
