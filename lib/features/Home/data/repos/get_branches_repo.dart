import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services/api_service_branches.dart';
import '../models/get_branches_request_body.dart';

class GetBranchesRepo {
  final ApiServiceBranches _apiService;
  GetBranchesRepo(this._apiService);

  Future<ApiResult<List<dynamic>>> GetBranches(
      GetBranchesRequestBody requestBody) async {
    try {
      final response = await _apiService.getAllBranchesList(requestBody);
      print('api request :::::: >>>> $response');
      return ApiResult.success(response);
    } catch (e) {
      print('error api request :::::: >>>> ${e.toString()}');
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

}
