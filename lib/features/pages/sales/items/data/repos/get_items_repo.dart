import 'package:h2m_destrib/core/networking/api_error_handler.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';
import 'package:h2m_destrib/core/networking/api_services/api_service_items.dart';
// ignore: unused_import
import 'package:h2m_destrib/core/networking/api_services/api_service_user.dart';

import '../models/get_items_request_body.dart';
import '../models/get_items_response.dart';


class GetItemsRepo {
  final ApiServiceItems _apiService;

  GetItemsRepo(this._apiService);

  Future<ApiResult<GetItemsResponse>> getAllItems(
      GetItemsRequestBody requestBody) async {
    try {
      final response = await _apiService.getAllItems(requestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
   Future<ApiResult<List<dynamic>>> getAllItemsList(
      GetItemsRequestBody requestBody) async {
    try {
      final response = await _apiService.getAllItemsList(requestBody);
      
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
