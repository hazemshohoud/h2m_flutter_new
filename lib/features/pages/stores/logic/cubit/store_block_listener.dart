import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h2m_destrib/core/helpers/extensions.dart';
import 'package:h2m_destrib/features/pages/stores/logic/cubit/storeitems_cubit.dart';
import 'package:h2m_destrib/features/pages/stores/logic/state/get_store_items_state.dart';

class StoreBlockListener extends StatelessWidget {
  const StoreBlockListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StoreitemsCubit, GetStoreItemsState>(
        listenWhen: (previous, current) =>
            current is StoreItemsStateLoading ||
            current is StoreItemsStateError ||
            current is StoreItemsStateSuccess,
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
