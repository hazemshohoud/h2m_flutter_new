import 'package:dio/dio.dart';
import 'package:h2m_destrib/features/pages/stores/data/models/harket_makhzan_request_body.dart';

import '../api_constants.dart';

class ApiServiceStoreItems {
  ApiServiceStoreItems(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= ApiConstants.apiBaseUrl;
  }

  final Dio _dio;

  String? baseUrl;

  Future<List<dynamic>> getStoreItemsList(
      HarketMakhzanRequestBody requestBody) async {
    try {
      final String combinedBaseUrl = _combineBaseUrls(
        _dio.options.baseUrl,
        baseUrl,
      );
      Response response =
          await _dio.post(combinedBaseUrl + ApiConstants.getStoreItems,
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

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
