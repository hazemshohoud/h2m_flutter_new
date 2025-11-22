import 'package:h2m_destrib/core/networking/api_error_handler.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';
import 'package:h2m_destrib/core/networking/api_services/api_service_store.dart';
// ignore: unused_import
import 'package:h2m_destrib/core/networking/api_services/api_service_user.dart';

import '../models/harket_makhzan_request_body.dart';
class GetStoreItemsRepo {
  final ApiServiceStoreItems _apiService;

  GetStoreItemsRepo(this._apiService);

   Future<ApiResult<List<dynamic>>> getStoreItemsList(
      HarketMakhzanRequestBody requestBody) async {
    try {
      final response = await _apiService.getStoreItemsList(requestBody);
      
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
