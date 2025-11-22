import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';
import '../../data/models/harket_makhzan_request_body.dart';
import '../../data/repos/get_store_items_repo.dart';
import '../state/get_store_items_state.dart';

class StoreitemsCubit extends Cubit<GetStoreItemsState> {
  final GetStoreItemsRepo _custRepo;

  static List itemsList = [];

  StoreitemsCubit(this._custRepo, GetStoreItemsRepo getStoreRepo)
      : super(const GetStoreItemsState.initial());

  Future<void> emitStoreStates(HarketMakhzanRequestBody requestBody) async {
    emit(const GetStoreItemsState.loading());
    final response = await _custRepo.getStoreItemsList(requestBody);
    response.when(success: (response) {
      itemsList = response;
      emit(GetStoreItemsState.success(response));
    }, failure: (error) {
      emit(GetStoreItemsState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  Future<List<dynamic>> getStoreItemsList(String idMosamAmal, String dateFrom,
      String dateTo, String idStore, int idFreaShrka) async {
    if (itemsList.isEmpty) {
      await emitStoreStates(HarketMakhzanRequestBody(
          date1: dateFrom,
          date2: dateTo,
          id_mosam: int.parse(idMosamAmal),
          id_frea_shrka: idFreaShrka,
          id_mkzan: int.parse(idStore)));
      if (itemsList.isNotEmpty) {
        //print('itemsList ${itemsList}');
        return itemsList;
      }
    }
    return itemsList;
  }

  @override
  void emit(GetStoreItemsState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
