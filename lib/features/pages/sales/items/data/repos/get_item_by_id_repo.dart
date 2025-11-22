import 'package:h2m_destrib/core/networking/api_error_handler.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';
import 'package:h2m_destrib/core/networking/api_services/api_service_items.dart';
// ignore: unused_import
import 'package:h2m_destrib/core/networking/api_services/api_service_user.dart';

import '../models/get_item_by_id_requestbody.dart';
import '../models/get_item_by_id_response.dart';


class GetItemByIdRepo {
  final ApiServiceItems _apiService;

  GetItemByIdRepo(this._apiService);

  Future<ApiResult<GetItemByIdResponse>> getAllItems(
      GetItemByIdRequestBody requestBody) async {
    try {
      final response = await _apiService.getItemById(requestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
