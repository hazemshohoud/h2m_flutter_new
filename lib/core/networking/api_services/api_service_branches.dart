import 'package:h2m_destrib/core/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:h2m_destrib/features/Home/data/models/get_branches_request_body.dart';

class ApiServiceBranches {
  ApiServiceBranches(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= ApiConstants.apiBaseUrl;
  }

  final Dio _dio;

  String? baseUrl;
  Future getAllBranchesList(GetBranchesRequestBody requestBody) async {
    try {
      Response response = await _dio.post(ApiConstants.getBranches,
          data: requestBody.toJson(),
          options: Options(
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
            },
          ));
      print(response.data);
      return response.data!;
    } catch (e) {
      print(e);
      return [];
    }
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
}
