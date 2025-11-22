import 'package:h2m_destrib/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:h2m_destrib/features/pages/customers_report/data/models/customer_report_response.dart';
import 'package:h2m_destrib/features/pages/customers_report/data/models/customers_report_request_body.dart';

class ApiServiceCustomersReport {
  ApiServiceCustomersReport(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= ApiConstants.apiBaseUrl;
  }

  final Dio _dio;

  String? baseUrl;
  Future<List<dynamic>> getCustReportItems(
      CustomersReportRequestBody requestBody) async {
    final extra = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(requestBody.toJson());
    final result = await _dio
        .fetch<List<dynamic>>(_setStreamType<CustomerReportResponse>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ).compose(
      _dio.options,
      ApiConstants.getHarketOmalaId,
      data: data,
    )));

    return result.data!;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
