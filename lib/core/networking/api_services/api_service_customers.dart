import 'package:h2m_destrib/core/networking/api_constants.dart';
import 'package:h2m_destrib/features/login/data/models/login_request_body.dart';
import 'package:h2m_destrib/features/login/data/models/login_response.dart';
import 'package:dio/dio.dart';
import 'package:h2m_destrib/features/pages/customers/data/models/get_customers_request_body.dart';
import 'package:h2m_destrib/features/pages/customers/data/models/get_customers_response.dart';

class ApiServiceCustomers {
  ApiServiceCustomers(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= ApiConstants.apiBaseUrl;
  }

  final Dio _dio;

  String? baseUrl;

  Future<List<dynamic>> getAllCustomersList(
      GetCustomersRequestBody requestBody) async {
    try {
      Response response = await _dio.post(ApiConstants.getAllCustomers,
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

  // latest function always upove
  Future<GetCustomersResponse> getAllCustomers(
      GetCustomersRequestBody requestBody) async {
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(requestBody.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetCustomersResponse>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ).compose(
      _dio.options,
      ApiConstants.getAllCustomers,
      queryParameters: queryParameters,
      data: data,
    )));
    final value = GetCustomersResponse.fromJson(result.data!);
    return value;
  }

  Future<LoginResponse> login(LoginRequestBody loginRequestBody) async {
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(loginRequestBody.toJson());
    final result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginResponse>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )
            .compose(
              _dio.options,
              ApiConstants.login,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = LoginResponse.fromJson(result.data!);
    return value;
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
}
