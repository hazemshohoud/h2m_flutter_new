import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';
import '../../data/models/get_mandoben_request_body.dart';
import '../../data/repos/get_mandoben_repo.dart';
import '../states/get_mandoben_state.dart';

class GetMandobenCubit extends Cubit<GetmandobenState> {
  final GetMandobenRepo _custRepo;
  final formKey = GlobalKey<FormState>();

  static List<dynamic> mandobenList = [];

  static var custOldDebitController = TextEditingController();

  static var paiedAmountController = TextEditingController();

  GetMandobenCubit(this._custRepo, GetMandobenRepo getCustomersRepo)
      : super(const GetmandobenState.initial());

  Future<List<dynamic>> gemandobenList(int idFreaShrka) async {
    //if (mandobenList.isEmpty) {
    emitGetmandobentates(GetMandobenRequestBody(
      id_frea_shrka: idFreaShrka,
    ));
    if (mandobenList.isNotEmpty) {
      print('list  >>>>>>>>>>>>> $mandobenList');

      return mandobenList;
    }
    //}
    return mandobenList;
  }

  void emitGetmandobentates(GetMandobenRequestBody requestBody) async {
    emit(const GetmandobenState.loading());
    final response = await _custRepo.Getmandoben(requestBody);

    response.when(success: (response) {
      print('response  >>>>>>>>>>>>> $response');

      mandobenList = response;
      emit(GetmandobenState.success(response));
    }, failure: (error) {
      emit(GetmandobenState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  @override
  void emit(GetmandobenState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
