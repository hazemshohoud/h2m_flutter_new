import 'package:h2m_destrib/core/networking/api_services/api_service_get_mandoben.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../models/get_mandoben_request_body.dart';

class GetMandobenRepo {
  final ApiServiceGetmandoben _apiService;
  GetMandobenRepo(this._apiService);

  Future<ApiResult<List<dynamic>>> Getmandoben(
      GetMandobenRequestBody requestBody) async {
    try {
      final response = await _apiService.getAllmandobenList(requestBody);
      print('api request :::::: >>>> $response');
      return ApiResult.success(response);
    } catch (e) {
      print('error api request :::::: >>>> ${e.toString()}');
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

}
