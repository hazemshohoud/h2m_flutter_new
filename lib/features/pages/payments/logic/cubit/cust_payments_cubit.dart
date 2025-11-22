import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';
import 'package:h2m_destrib/features/pages/payments/logic/state/add_cust_payments_state.dart';

import '../../Data/models/add_cust_payments_request_body.dart';
import '../../Data/models/get_payments_request_body.dart';
import '../../Data/repos/cust_payments_repo.dart';

class CustPaymentsCubit extends Cubit<AddCustPaymentsState> {
  final CustPaymentsRepo _custRepo;
  final formKey = GlobalKey<FormState>();

  static List<dynamic> paymentsList = [];

  static String currCustName = 'حدد العميل';

  static var currCustId = -1;

  static var custOldDebitController = TextEditingController();

  static var paiedAmountController = TextEditingController();

  var dateFromController = TextEditingController();

  var dateToController = TextEditingController();

  CustPaymentsCubit(this._custRepo, CustPaymentsRepo getCustomersRepo)
      : super(const AddCustPaymentsState.initial());

  Future<void> emitAddCustPaymentStates(
      AddCustPaymentsRequestBody requestBody) async {
    emit(const AddCustPaymentsState.loading());
    final response = await _custRepo.addCustPayment(requestBody);
    response.when(success: (response) {
      emit(AddCustPaymentsState.success(response));
    }, failure: (error) {
      emit(
          AddCustPaymentsState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  Future<void> emitGetCustPaymentStates(
      GetPaymentsRequestBody requestBody) async {
    paymentsList = [];
    emit(const AddCustPaymentsState.loading());
    final response = await _custRepo.getPayments(requestBody);
    response.when(success: (response) {
      paymentsList = response;
      emit(AddCustPaymentsState.success(response));
    }, failure: (error) {
      emit(
          AddCustPaymentsState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  Future<List<dynamic>> getPaymentList(String idMosamBeeOmla, String date1,
      String date2, String idMakhzan, String idFreaShrka) async {
    if (paymentsList.isEmpty) {
      await emitGetCustPaymentStates(GetPaymentsRequestBody(
        quentomla: 10,
        date1: date1,
        date2: date2,
        id_mosam_bee_omla: int.parse(idMosamBeeOmla),
        id_frea_shrka: int.parse(idFreaShrka),
      ));
      if (paymentsList.isNotEmpty) {
        print('itemsList $paymentsList');
        return paymentsList;
      }
    }
    return paymentsList;
  }

  @override
  void emit(AddCustPaymentsState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  Future<void> emitDeleteCustPaymentStates(deletePaymentRequestBody) async {
    emit(const AddCustPaymentsState.loading());
    _custRepo.deletePayment(deletePaymentRequestBody).when(success: (response) {
      emit(AddCustPaymentsState.success(response));
    }, failure: (error) {
      emit(
          AddCustPaymentsState.error(error: error.apiErrorModel.message ?? ""));
    });
  }
}
