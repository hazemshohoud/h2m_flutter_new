import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';

import '../../data/models/get_branches_request_body.dart';
import '../../data/repos/get_branches_repo.dart';
import '../states/branches_state.dart';

class GetBranchesCubit extends Cubit<GetBranchesState> {
  final GetBranchesRepo _custRepo;
  final formKey = GlobalKey<FormState>();

  static List<dynamic> branchesList = [];

  static String currCustName = 'حدد العميل';

  static var currCustId = -1;

  static var custOldDebitController = TextEditingController();

  static var paiedAmountController = TextEditingController();

  GetBranchesCubit(this._custRepo, GetBranchesRepo getCustomersRepo)
      : super(const GetBranchesState.initial());
  Future<List<dynamic>> geBranchesList() async {
    if (branchesList.isEmpty) {
      emitGetBranchestates(GetBranchesRequestBody());
      if (branchesList.isNotEmpty) {
        print('list  >>>>>>>>>>>>> $branchesList');

        return branchesList;
      }
    }
    return branchesList;
  }

  void emitGetBranchestates(GetBranchesRequestBody requestBody) async {
    emit(const GetBranchesState.loading());
    final response = await _custRepo.GetBranches(requestBody);

    response.when(success: (response) {
      print('response  >>>>>>>>>>>>> $branchesList');

      branchesList = response;
      emit(GetBranchesState.success(response));
    }, failure: (error) {
      emit(GetBranchesState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  @override
  void emit(GetBranchesState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
