import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';
import 'package:h2m_destrib/features/pages/customers/data/repos/get_customers_repo.dart';

import '../../data/models/get_customers_request_body.dart';

part '../state/customers_state.dart';
part 'customers_cubit.freezed.dart';

class CustomersCubit extends Cubit<CustomersState> {
  final GetCustomersRepo _custRepo;
  final formKey = GlobalKey<FormState>();
  List<dynamic> customersList = [];
  GlobalKey<FormState> customerFormKey = GlobalKey<FormState>();
  TextEditingController custNameTextController = TextEditingController();

  TextEditingController custAddressTextController = TextEditingController();

  TextEditingController custPhoneTextController = TextEditingController();

  CustomersCubit(this._custRepo, GetCustomersRepo getCustomersRepo)
      : super(const CustomersState.initial());

  Future<void> emitCustomersStates(GetCustomersRequestBody requestBody) async {
    emit(const CustomersState.loading());
    customersList = [];
    final response = await _custRepo.getAllCustomersList(requestBody);
    response.when(success: (response) {
      customersList = response;
      emit(CustomersState.success(response));
    }, failure: (error) {
      emit(CustomersState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  Future<List<dynamic>> getCustomersList(
      int idFreaShrka, String name, int quentomla) async {
    if (customersList.isEmpty) {
      await emitCustomersStates(GetCustomersRequestBody(
          id_frea_shrka: idFreaShrka, name: name, quentomla: quentomla));
      if (customersList.isNotEmpty) {
        return customersList;
      }
    }
    return customersList;
  }
}
