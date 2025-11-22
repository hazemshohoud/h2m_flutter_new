import 'package:h2m_destrib/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:h2m_destrib/features/pages/sales/items/data/models/get_item_by_id_requestbody.dart';
import 'package:h2m_destrib/features/pages/sales/items/data/models/get_item_by_id_response.dart';
import 'package:h2m_destrib/features/pages/sales/items/data/models/get_items_request_body.dart';
import 'package:h2m_destrib/features/pages/sales/items/data/models/get_items_response.dart';

class ApiServiceItems {
  ApiServiceItems(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= ApiConstants.apiBaseUrl;
  }

  final Dio _dio;

  String? baseUrl;
  Future<GetItemByIdResponse> getItemById(
      GetItemByIdRequestBody requestBody) async {
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(requestBody.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetItemByIdResponse>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ).compose(
      _dio.options,
      ApiConstants.getProductId,
      queryParameters: queryParameters,
      data: data,
    )));
    final value = GetItemByIdResponse.fromJson(result.data!);
    return value;
  }

  Future getAllItemsList(GetItemsRequestBody requestBody) async {
    try {
      Response response = await _dio.post(ApiConstants.getProduts,
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

  Future<GetItemsResponse> getAllItems(GetItemsRequestBody requestBody) async {
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(requestBody.toJson());
    final result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetItemsResponse>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ).compose(
      _dio.options,
      ApiConstants.getProduts,
      queryParameters: queryParameters,
      data: data,
    )));
    final value = GetItemsResponse.fromJson(result.data!);
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
}
