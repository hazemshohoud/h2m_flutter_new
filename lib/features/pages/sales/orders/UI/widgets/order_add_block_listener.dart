import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h2m_destrib/core/helpers/extensions.dart';

import '../../logic/cubit/order_add_cubit.dart';

class OrderAddBlockListener extends StatelessWidget {
  const OrderAddBlockListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersAddCubit, OrderAddState>(
        listenWhen: (previous, current) =>
            current is Loading || current is Error || current is Success,
        listener: (context, state) {
          state.whenOrNull(loading: () {
            showDialog(
                context: context,
                builder: (context) =>
                    const Center(child: CircularProgressIndicator()));
          }, error: (error) {
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('برجاء مراجعة البيانات ليتم الحفظ بشكل صحيح'),
              ),
            );
          },
              success: (OrderAddResponse) {
                
                context.pop();
              });
        },
        child: const SizedBox.shrink());
  }
}
