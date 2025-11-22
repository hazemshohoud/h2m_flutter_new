import 'package:h2m_destrib/core/networking/api_services/api_service_payments.dart';
import 'package:h2m_destrib/features/pages/payments/Data/models/get_payments_request_body.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../models/add_cust_payments_request_body.dart';
import '../models/add_cust_payments_response.dart';

class CustPaymentsRepo {
  final ApiServicePayments _apiService;
  CustPaymentsRepo(this._apiService);

  Future<ApiResult<AddCustPaymentsResponse>> addCustPayment(
      AddCustPaymentsRequestBody requestBody) async {
    try {
      final response = await _apiService.addCustPayments(requestBody);
      return ApiResult.success(response);
    } catch (e) {
      print('error api request :::::: >>>> ${e.toString()}');
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<List<dynamic>>> getPayments(
      GetPaymentsRequestBody requestBody) async {
    try {
      final response = await _apiService.getPayments(requestBody);
      return ApiResult.success(response);
    } catch (e) {
      print('error api request :::::: >>>> ${e.toString()}');
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  ApiResult deletePayment(deletePaymentRequestBody) {
    try {
      return ApiResult.success(
          _apiService.deletePayment(deletePaymentRequestBody));
    } catch (e) {
      print('error api request :::::: >>>> ${e.toString()}');
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
