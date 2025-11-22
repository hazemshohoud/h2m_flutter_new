import 'package:h2m_destrib/core/networking/api_services/api_service_get_stores.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../models/get_stores_request_body.dart';

class GetStoresRepo {
  final ApiServiceGetStores _apiService;
  GetStoresRepo(this._apiService);

  Future<ApiResult<List<dynamic>>> GetStores(
      GetStoresRequestBody requestBody) async {
    try {
      final response = await _apiService.getAllStoresList(requestBody);
      print('api request :::::: >>>> $response');
      return ApiResult.success(response);
    } catch (e) {
      print('error api request :::::: >>>> ${e.toString()}');
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

}
