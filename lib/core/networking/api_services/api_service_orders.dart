import 'package:dio/dio.dart';
import 'package:h2m_destrib/features/pages/sales/items/data/models/get_item_by_id_requestbody.dart';
import 'package:h2m_destrib/features/pages/sales/items/data/models/get_item_by_id_response.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/add_models/order_add_response.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/details_models/order_details_requet_body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/details_models/order_details_response.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/add_models/orders_add_request_body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_harket_amel_response.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_hraket_amel_request_body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_idsndok_request_body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_idsndok_response.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_idwrdya_response.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_orderid_request_body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_orderid_response.dart';

import '../../../features/pages/sales/orders/data/models/add_models/add_edda_request_body.dart';
import '../../../features/pages/sales/orders/data/models/add_models/add_edda_response.dart';
import '../../../features/pages/sales/orders/data/models/getdata_models/get_idwrdya_request_Body.dart';
import '../api_constants.dart';

class ApiServiceOrders {
  ApiServiceOrders(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= ApiConstants.apiBaseUrl;
  }

  final Dio _dio;

  String? baseUrl;

  Future<AddEddaResponse> addHarketEdda(AddEddaRequestBody requestBody) async {
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{}; //
    final headers = <String, dynamic>{}; //
    final data = <String, dynamic>{}; //
    data.addAll(requestBody.toJson());
    final result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AddEddaResponse>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )
            .compose(
              _dio.options,
              ApiConstants.addHarketEdda,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = AddEddaResponse.fromJson(result.data!);
    return value;
  }

  Future<GetItemByIdResponse> getItemById(
      GetItemByIdRequestBody requestBody) async {
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{}; //
    final headers = <String, dynamic>{}; //
    final data = <String, dynamic>{}; //
    data.addAll(requestBody.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetItemByIdResponse>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )
            .compose(
              _dio.options,
              ApiConstants.getProductId,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetItemByIdResponse.fromJson(result.data!);
    return value;
  }

  Future<GetIdWrdyaResponse> getIdWrdya(
      GetIdWrdyaRequestBody requestBody) async {
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{}; //
    final headers = <String, dynamic>{}; //
    final data = <String, dynamic>{}; //
    data.addAll(requestBody.toJson());
    final result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetIdWrdyaResponse>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )
            .compose(
              _dio.options,
              ApiConstants.getWardia,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetIdWrdyaResponse.fromJson(result.data!);
    print(value);
    return value;
  }

  Future<GetIdsndokResponse> getIdSndok(
      GetIdsndokRequestBody requestBody) async {
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{}; //
    final headers = <String, dynamic>{}; //
    final data = <String, dynamic>{}; //
    data.addAll(requestBody.toJson());
    final result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetIdsndokResponse>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )
            .compose(
              _dio.options,
              ApiConstants.addNakdia,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetIdsndokResponse.fromJson(result.data!["id_wardya"]);
    return value;
  }

  Future<GetHarketAmelResponse> getHarketAmel(
      GetHraketAmelRequestBody requestBody) async {
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{}; //
    final headers = <String, dynamic>{}; //
    final data = <String, dynamic>{}; //
    data.addAll(requestBody.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetHarketAmelResponse>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )
            .compose(
              _dio.options,
              ApiConstants.getIdHrketOmla,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetHarketAmelResponse.fromJson(result.data!);
    return value;
  }

  Future<GetOrderIdResponse> getOrderId(
      GetOrderIdRequestBody requestBody) async {
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{}; //
    final headers = <String, dynamic>{}; //
    final data = <String, dynamic>{}; //
    data.addAll(requestBody.toJson());
    final result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetOrderIdResponse>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )
            .compose(
              _dio.options,
              ApiConstants.getOrderId,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetOrderIdResponse.fromJson(result.data!);
    return value;
  }

  Future<int> saveOrder(OrdersAddRequestBody requestBody) async {
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    data.addAll(requestBody.toJson());
    final result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<OrderAddResponse>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )
            .compose(
              _dio.options,
              ApiConstants.addOrder,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));

    final value = OrderAddResponse.fromJson(result.data!);
    return value.IdOrder!;
  }

  Future<OrderDetailsResponse> saveOrderDetails(
      OrdersDetailsRequestBody requestBody) async {
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{}; //
    final headers = <String, dynamic>{}; //
    final data = <String, dynamic>{}; //
    data.addAll(requestBody.toJson());
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OrderDetailsResponse>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    )
            .compose(
              _dio.options,
              ApiConstants.addOrderDetels,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = OrderDetailsResponse.fromJson(result.data!);
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
