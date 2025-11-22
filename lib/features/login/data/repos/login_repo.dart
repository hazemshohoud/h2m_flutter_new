import 'package:h2m_destrib/core/networking/api_error_handler.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';
import 'package:h2m_destrib/core/networking/api_services/api_service_user.dart';
import 'package:h2m_destrib/features/login/data/models/login_request_body.dart';
import 'package:h2m_destrib/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiServiceUser _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> logiIn(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      print(e);
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
