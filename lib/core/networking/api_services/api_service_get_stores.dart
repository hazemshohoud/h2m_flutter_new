import 'package:h2m_destrib/core/networking/api_constants.dart';
import 'package:dio/dio.dart';

import '../../../features/Home/data/models/get_stores_request_body.dart';

class ApiServiceGetStores {
  ApiServiceGetStores(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= ApiConstants.apiBaseUrl;
  }

  final Dio _dio;

  String? baseUrl;

  Future<List<dynamic>> getAllStoresList(
      GetStoresRequestBody requestBody) async {
    try {
      Response response = await _dio.post(ApiConstants.getMkhazen,
          data: requestBody.toJson(),
          options: Options(
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
            },
          ));
      return response.data!;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
