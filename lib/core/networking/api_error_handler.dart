import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_error_model.dart';

// TODO: wallahy I will refactor this .. Omar Ahmed
enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found
  static const int API_LOGIC_ERROR = 422; // API , lOGIC ERROR

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String NO_CONTENT = ApiErrors.noContent;
  static const String BAD_REQUEST = ApiErrors.badRequestError;
  static const String UNAUTORISED = ApiErrors.unauthorizedError;
  static const String FORBIDDEN = ApiErrors.forbiddenError;
  static const String INTERNAL_SERVER_ERROR = ApiErrors.internalServerError;
  static const String NOT_FOUND = ApiErrors.notFoundError;

  // local status code
  static String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  static String CANCEL = ApiErrors.defaultError;
  static String RECIEVE_TIMEOUT = ApiErrors.timeoutError;
  static String SEND_TIMEOUT = ApiErrors.timeoutError;
  static String CACHE_ERROR = ApiErrors.cacheError;
  static String NO_INTERNET_CONNECTION = ApiErrors.noInternetError;
  static String DEFAULT = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return ApiErrorModel(
            code: ResponseCode.NO_CONTENT, message: ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return ApiErrorModel(
            code: ResponseCode.BAD_REQUEST,
            message: ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return ApiErrorModel(
            code: ResponseCode.FORBIDDEN, message: ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTORISED:
        return ApiErrorModel(
            code: ResponseCode.UNAUTORISED,
            message: ResponseMessage.UNAUTORISED);
      case DataSource.NOT_FOUND:
        return ApiErrorModel(
            code: ResponseCode.NOT_FOUND, message: ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return ApiErrorModel(
            code: ResponseCode.INTERNAL_SERVER_ERROR,
            message: ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return ApiErrorModel(
            code: ResponseCode.CONNECT_TIMEOUT,
            message: ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return ApiErrorModel(
            code: ResponseCode.CANCEL, message: ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return ApiErrorModel(
            code: ResponseCode.RECIEVE_TIMEOUT,
            message: ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return ApiErrorModel(
            code: ResponseCode.SEND_TIMEOUT,
            message: ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return ApiErrorModel(
            code: ResponseCode.CACHE_ERROR,
            message: ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return ApiErrorModel(
            code: ResponseCode.NO_INTERNET_CONNECTION,
            message: ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return ApiErrorModel(
            code: ResponseCode.DEFAULT, message: ResponseMessage.DEFAULT);
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;
  late dynamic originalError;

  ErrorHandler.handle(dynamic error) {
    originalError = error;

    if (error is DioException) {
      apiErrorModel = _handleError(error);
    } else {
      // default error مع تفاصيل الخطأ الأصلي
      apiErrorModel = ApiErrorModel(
        code: ResponseCode.DEFAULT,
        message: "Non-Dio Error: ${error.toString()}",
      );
    }

    // طباعة تفاصيل الخطأ في الكونسول
    _printErrorDetails();
  }

  // دالة لطباعة تفاصيل الخطأ
  void _printErrorDetails() {
    print('🔴 ========== API ERROR DETAILS ==========');
    print('🔴 Error Code: ${apiErrorModel.code}');
    print('🔴 Error Message: ${apiErrorModel.message}');

    if (originalError is DioException) {
      final dioError = originalError as DioException;
      print('🔴 Dio Error Type: ${dioError.type}');
      print('🔴 Dio Error Message: ${dioError.message}');
      print('🔴 Status Code: ${dioError.response?.statusCode}');
      print('🔴 Response Data: ${dioError.response?.data}');
      print('🔴 URL: ${dioError.requestOptions.uri}');
      print('🔴 Method: ${dioError.requestOptions.method}');
    }
    print('🔴 =======================================');
  }

  // دالة مساعدة للحصول على التفاصيل الكاملة
  String get fullErrorDetails {
    if (originalError is DioException) {
      final dioError = originalError as DioException;
      return '''
🎯 API ERROR DETAILS:
• Type: ${dioError.type}
• Message: ${dioError.message}
• Status Code: ${dioError.response?.statusCode}
• Response: ${dioError.response?.data}
• URL: ${dioError.requestOptions.uri}
• Method: ${dioError.requestOptions.method}
• Headers: ${dioError.requestOptions.headers}
''';
    }
    return "Original Error: ${originalError.toString()}";
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null && error.response?.statusCode != null) {
        try {
          // محاولة تحليل ال response من السيرفر
          return ApiErrorModel.fromJson(error.response!.data);
        } catch (e) {
          // إذا فشل التحليل، نعيد رسالة الخطأ الحقيقية من السيرفر
          final statusCode = error.response!.statusCode;
          final statusMessage =
              error.response!.statusMessage ?? 'No status message';
          final responseData =
              error.response!.data?.toString() ?? 'No response data';

          return ApiErrorModel(
            code: statusCode ?? ResponseCode.DEFAULT,
            message:
                "Server Error $statusCode: $statusMessage\nResponse: $responseData",
          );
        }
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null && error.response?.statusCode != null) {
        try {
          return ApiErrorModel.fromJson(error.response!.data);
        } catch (e) {
          // إرجاع رسالة الخطأ الحقيقية
          final statusCode = error.response!.statusCode;
          final statusMessage =
              error.response!.statusMessage ?? 'No status message';
          final responseData =
              error.response!.data?.toString() ?? 'No response data';

          return ApiErrorModel(
            code: statusCode ?? ResponseCode.DEFAULT,
            message:
                "Unknown Error $statusCode: $statusMessage\nResponse: $responseData",
          );
        }
      } else {
        // إرجاع رسالة الخطأ الأصلية من Dio
        return ApiErrorModel(
          code: ResponseCode.DEFAULT,
          message: "Connection Error: ${error.message ?? 'Unknown error'}",
        );
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.NO_INTERNET_CONNECTION.getFailure();
    case DioExceptionType.badCertificate:
      return ApiErrorModel(
        code: ResponseCode.DEFAULT,
        message: "Certificate Error: ${error.message ?? 'Bad certificate'}",
      );
  }
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}

// دالة مساعدة لل debugging
void debugApiError(dynamic error) {
  if (error is ErrorHandler) {
    print('🎯 ========== DEBUG API ERROR ==========');
    print('🎯 Error Code: ${error.apiErrorModel.code}');
    print('🎯 Error Message: ${error.apiErrorModel.message}');
    print('🎯 Full Details: ${error.fullErrorDetails}');
    print('🎯 =====================================');
  } else if (error is DioException) {
    print('🎯 ========== DEBUG DIO ERROR ==========');
    print('🎯 Type: ${error.type}');
    print('🎯 Message: ${error.message}');
    print('🎯 Status Code: ${error.response?.statusCode}');
    print('🎯 Response: ${error.response?.data}');
    print('🎯 URL: ${error.requestOptions.uri}');
    print('🎯 =====================================');
  } else {
    print('🎯 ========== DEBUG UNKNOWN ERROR ==========');
    print('🎯 Error: $error');
    print('🎯 =========================================');
  }
}
