import 'package:h2m_destrib/core/networking/api_error_handler.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';
import 'package:h2m_destrib/core/networking/api_services/api_service_customers.dart';
// ignore: unused_import
import 'package:h2m_destrib/core/networking/api_services/api_service_user.dart';

import '../models/get_customers_request_body.dart';
import '../models/get_customers_response.dart';

class GetCustomersRepo {
  final ApiServiceCustomers _apiService;

  GetCustomersRepo(this._apiService);

  Future<ApiResult<GetCustomersResponse>> getAllCustomers(
      GetCustomersRequestBody requestBody) async {
    try {
      final response = await _apiService.getAllCustomers(requestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
   Future<ApiResult<List<dynamic>>> getAllCustomersList(
      GetCustomersRequestBody requestBody) async {
    try {
      final response = await _apiService.getAllCustomersList(requestBody);
      
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
