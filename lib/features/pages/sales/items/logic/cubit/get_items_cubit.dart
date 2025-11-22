import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';

import '../../data/models/get_items_request_body.dart';
import '../../data/repos/get_items_repo.dart';

part 'get_items_state.dart';
part 'get_items_cubit.freezed.dart';

class ItemsCubit extends Cubit<GetItemsState> {
  final GetItemsRepo _Repo;
  final formKey = GlobalKey<FormState>();
  final ordersAddFormKey = GlobalKey<FormState>();
  final itemAddFormKey = GlobalKey<FormState>();
  List<dynamic> ItemsList = [];
  ItemsCubit(this._Repo, GetItemsRepo getItemsRepo)
      : super(const GetItemsState.initial());

  Future<void> emitItemsStates(GetItemsRequestBody requestBody) async {
    emit(const GetItemsState.loading());
    final response = await _Repo.getAllItemsList(requestBody);
    response.when(success: (response) {
      ItemsList = response;
      emit(GetItemsState.success(response));
    }, failure: (error) {
      emit(GetItemsState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  Future<List<dynamic>> getItemsList(String AvergSerSHra, String name,
      int NumberOfPage, int idMosam, int idMkhzan) async {
    ItemsList = [];
    //if (ItemsList.isEmpty) {
    await emitItemsStates(GetItemsRequestBody(
      AvergSerSHra: AvergSerSHra,
      NumberOfPage: NumberOfPage,
      id_mkhzan: idMkhzan,
      id_mosam: idMosam,
      name_montag: name,
      id_sanf_hiden: 0, // Assuming this is a required field
    ));
    if (ItemsList.isNotEmpty) {
      return ItemsList;
    }

    return [];
  }
}
