import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h2m_destrib/core/helpers/extensions.dart';
import 'package:h2m_destrib/features/Home/logic/cubits/branches_cubit.dart';
import 'package:h2m_destrib/features/Home/logic/states/branches_state.dart';


class GetBranchesBlockListener extends StatelessWidget {
  const GetBranchesBlockListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetBranchesCubit, GetBranchesState>(
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
                content: Text('خطأ فى استدعاء البيانات'),
              ),
            );
          },
              success: (harketMakhzenResponseBody) {
                GetBranchesCubit.branchesList = harketMakhzenResponseBody;
              print("FROM BLOCK LISTENER ::::::::::: $harketMakhzenResponseBody");
                context.pop();
              });
        },
        child: const SizedBox.shrink());
  }
}
