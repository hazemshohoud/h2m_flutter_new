import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h2m_destrib/core/helpers/extensions.dart';
import 'package:h2m_destrib/features/pages/payments/logic/cubit/cust_payments_cubit.dart';
import 'package:h2m_destrib/features/pages/payments/logic/state/add_cust_payments_state.dart';

class CustPayBlockListener extends StatelessWidget {
  const CustPayBlockListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustPaymentsCubit, AddCustPaymentsState>(
        listenWhen: (previous, current) =>
            current is CustPaymentsStateLoading ||
            current is CustPaymentsStateError ||
            current is CustPaymentsStateSuccess,
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
                content: Text('خطأ فى استدعاء البيانات'),
              ),
            );
          }, success: (HarketMakhzenResponseBody) {
            //StoreitemsCubit.itemsList = HarketMakhzenResponseBody;
            context.pop();
          });
        },
        child: const SizedBox.shrink());
  }
}
