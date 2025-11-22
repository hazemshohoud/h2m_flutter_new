import 'package:h2m_destrib/features/login/data/models/get_mosam_amal_response.dart';
import 'package:h2m_destrib/features/login/data/models/representative_request_body.dart';
import 'package:h2m_destrib/features/login/data/models/representative_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services/api_service_user.dart';

class RepresentativeRepo {
  final ApiServiceUser _apiService;
  RepresentativeRepo(this._apiService);

  Future<ApiResult<RepresentativeResponse>> getRepresentative(
    RepresentativeRequestBody representativeRequestBody) async {
    try {
      final response = await _apiService.getRepresentative(representativeRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      print('error api request :::::: >>>> ${e.toString()}');
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<GetMosamAmalResponse>> getMosamAmal() async{
    try {
      final response = await _apiService.getMosamAmal();
      return ApiResult.success(response);
    } catch (e) {
      print('error api request :::::: >>>> ${e.toString()}');
      return ApiResult.failure(ErrorHandler.handle(e));
    }    
  }
}