import 'package:h2m_destrib/core/networking/api_error_handler.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';
import 'package:h2m_destrib/core/networking/api_services/api_service_customers_report.dart';
// ignore: unused_import
import 'package:h2m_destrib/core/networking/api_services/api_service_user.dart';
import 'package:h2m_destrib/features/pages/customers_report/data/models/customers_report_request_body.dart';

class CustomersReportRepo {
  final ApiServiceCustomersReport _apiService;

  CustomersReportRepo(this._apiService);

  Future<ApiResult<List<dynamic>>> getCustReportItems(
      CustomersReportRequestBody requestBody) async {
    try {
      final response = await _apiService.getCustReportItems(requestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
