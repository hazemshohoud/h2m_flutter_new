import 'package:dio/dio.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';
import 'package:h2m_destrib/features/pages/payments/Data/models/add_cust_payments_request_body.dart';
import 'package:h2m_destrib/features/pages/payments/Data/models/add_cust_payments_response.dart';
import 'package:h2m_destrib/features/pages/payments/Data/models/get_payments_request_body.dart';

import '../api_constants.dart';

class ApiServicePayments {
  ApiServicePayments(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= ApiConstants.apiBaseUrl;
  }

  final Dio _dio;

  String? baseUrl;

  Future<List<dynamic>> getPayments(GetPaymentsRequestBody requestBody) async {
    try {
      final String combinedBaseUrl = _combineBaseUrls(
        _dio.options.baseUrl,
        baseUrl,
      );
      Response response =
          await _dio.post(combinedBaseUrl + ApiConstants.getHarketOmala,
              data: requestBody.toJson(),
              options: Options(
                method: 'POST',
                headers: {
                  'Content-Type': 'application/json',
                },
              ));
      return response.data!;
    } catch (e) {
      print(e);
      return [];
    }
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

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }

  Future<AddCustPaymentsResponse> addCustPayments(
      AddCustPaymentsRequestBody requestBody) async {
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{}; //
    final headers = <String, dynamic>{}; //
    final data = <String, dynamic>{}; //
    data.addAll(requestBody.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddCustPaymentsResponse>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )
            .compose(
              _dio.options,
              ApiConstants.addHrketOmla,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = AddCustPaymentsResponse.fromJson(result.data!);
    return value;
  }

  Future<ApiResult<bool>> deletePayment(deletePaymentRequestBody) async {
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{}; //
    final headers = <String, dynamic>{}; //
    final data = <String, dynamic>{}; //
    data.addAll(deletePaymentRequestBody.toJson());
    final result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<String>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )
            .compose(
              _dio.options,
              ApiConstants.deleteHarketOmala,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    return ApiResult.success(
        result.statusCode == 200 && result.statusCode == 201);
  }
}
