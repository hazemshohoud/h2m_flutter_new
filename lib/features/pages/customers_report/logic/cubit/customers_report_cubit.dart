import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';
import 'package:h2m_destrib/features/pages/customers_report/data/repos/customers_report_repo.dart';

import '../../data/models/customers_report_request_body.dart';

part '../state/customers_report_state.dart';
part 'customers_report_cubit.freezed.dart';

class CustomersReportCubit extends Cubit<CustomersReportState> {
  final CustomersReportRepo _custRepo;
  var custNameTextController = TextEditingController();
  var dateFromController = TextEditingController();
  var dateToController = TextEditingController();
  List<dynamic> customersReportList = [];

  double totalPeriod = 0.0;

  int currCustId = -1;

  double totalPays = 0.0;

  double totalReturns = 0.0;

  double totalCustPaied = 0.0;

  CustomersReportRequestBody requestBody = CustomersReportRequestBody(
    date1: '',
    date2: '',
    id_amel: -1,
    id_mosam_bee_omla: -1,
    id_frea_shrka: -1,
    qountPage: 10,
  );

  int qountPage = 10;

  CustomersReportCubit(this._custRepo, CustomersReportRepo getCustomersRepo)
      : super(const CustomersReportState.initial());

  Future<void> emitCustomersStates(
      CustomersReportRequestBody requestBody) async {
    emit(const CustomersReportState.loading());
    customersReportList = [];
    final response = await _custRepo.getCustReportItems(requestBody);
    response.when(success: (response) {
      customersReportList = response;
      totalPeriod = 0.0;
      totalReturns = 0.0;
      totalCustPaied = 0.0;
      totalPays = 0.0;
      for (int i = 0; i < customersReportList.length; i++) {
        totalPeriod += customersReportList[i]['egmaley'];
      }
      for (int i = 0; i < customersReportList.length; i++) {
        totalReturns += customersReportList[i]['mortga'];
      }
      for (int i = 0; i < customersReportList.length; i++) {
        totalCustPaied += customersReportList[i]['mohsal'];
      }
      for (int i = 0; i < customersReportList.length; i++) {
        totalPays += customersReportList[i]['mosdad'];
      }
      emit(CustomersReportState.success(response));
    }, failure: (error) {
      emit(
          CustomersReportState.error(error: error.apiErrorModel.message ?? ""));
    });
  }
}
