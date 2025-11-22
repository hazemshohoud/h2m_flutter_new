import 'package:h2m_destrib/core/networking/api_error_handler.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';
import 'package:h2m_destrib/core/networking/api_services/api_service_orders.dart';
import 'package:h2m_destrib/features/pages/sales/items/data/models/get_item_by_id_requestbody.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/details_models/order_details_requet_body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/details_models/order_details_response.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_harket_amel_response.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_hraket_amel_request_body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_idsndok_request_body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_idsndok_response.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_idwrdya_request_Body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_idwrdya_response.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_orderid_request_body.dart';
import 'package:h2m_destrib/features/pages/sales/orders/data/models/getdata_models/get_orderid_response.dart';

import '../models/add_models/add_edda_request_body.dart';
import '../models/add_models/orders_add_request_body.dart';

class OrdersAddRepo {
  final ApiServiceOrders _apiService;

  OrdersAddRepo(this._apiService);
  Future<ApiResult<GetIdWrdyaResponse>> getIdWardya(
      GetIdWrdyaRequestBody requestBody) async {
    try {
      final response = await _apiService.getIdWrdya(requestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<GetIdsndokResponse>> getIdSndok(
      GetIdsndokRequestBody requestBody) async {
    try {
      final response = await _apiService.getIdSndok(requestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<GetHarketAmelResponse>> getHarketAmel(
      GetHraketAmelRequestBody requestBody) async {
    try {
      final response = await _apiService.getHarketAmel(requestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<GetOrderIdResponse>> getOrderId(
      GetOrderIdRequestBody requestBody) async {
    try {
      final response = await _apiService.getOrderId(requestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<int>> saveOrder(OrdersAddRequestBody requestBody) async {
    try {
      final response = await _apiService.saveOrder(requestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<OrderDetailsResponse>> saveOrderDetails(
      OrdersDetailsRequestBody requestBody) async {
    try {
      final response = await _apiService.saveOrderDetails(requestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  ApiResult getItemById(GetItemByIdRequestBody requestBody) {
    try {
      final response = _apiService.getItemById(requestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  ApiResult addHarketEdda(AddEddaRequestBody requestBody) {
    try {
      return ApiResult.success(_apiService.addHarketEdda(requestBody));
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
