import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';
import '../../data/models/get_stores_request_body.dart';
import '../../data/repos/get_stores_repo.dart';
import '../states/get_stores_state.dart';

class GetStoresCubit extends Cubit<GetStoresState> {
  final GetStoresRepo _custRepo;
  final formKey = GlobalKey<FormState>();

  static List<dynamic> StoresList = [];

  static var custOldDebitController = TextEditingController();

  static var paiedAmountController = TextEditingController();

  var dateFromController = TextEditingController();

  var dateToController = TextEditingController();

  GetStoresCubit(this._custRepo, GetStoresRepo getCustomersRepo)
      : super(const GetStoresState.initial());
  Future<List<dynamic>> geStoresList(int idFreaShrka) async {
    //if (StoresList.isEmpty) {
    emitGetStorestates(GetStoresRequestBody(
      id_frea_shrka: idFreaShrka,
    ));
    if (StoresList.isNotEmpty) {
      print('list  >>>>>>>>>>>>> $StoresList');

      return StoresList;
    }
    //}
    return StoresList;
  }

  void emitGetStorestates(GetStoresRequestBody requestBody) async {
    emit(const GetStoresState.loading());
    final response = await _custRepo.GetStores(requestBody);

    response.when(success: (response) {
      print('response  >>>>>>>>>>>>> $response');

      StoresList = response;
      emit(GetStoresState.success(response));
    }, failure: (error) {
      emit(GetStoresState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  @override
  void emit(GetStoresState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
