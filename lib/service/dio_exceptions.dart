import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;
  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = 'Request cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout";
        break;
      case DioExceptionType.connectionError:
        message = "No internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout";
        break;
      case DioExceptionType.badResponse:
        message = _handleStatusCode(
            dioError.response!.statusCode, dioError.response!.data);
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout";
        break;
      default:
        message = 'Something went wrong';
        break;
    }
  }

  String _handleStatusCode(int? statusCode, dynamic data) {
    final message =
        data is Map<String, String> ? data['error'] : "Something went wrong";
    switch (statusCode) {
      case 400:
        return message ?? 'Bad request.';
      case 401:
        return message ?? 'Authentication failed.';
      case 403:
        return message ??
            'The authenticated user is not allowed to access the specified API endpoint.';
      case 404:
        return message ?? 'The requested resource does not exist.';
      case 405:
        return message ??
            'Method not allowed. Please check the Allow header for the allowed HTTP methods.';
      case 415:
        return message ??
            'Unsupported media type. The requested content type or version number is invalid.';
      case 422:
        return message ?? 'Data validation failed.';
      case 429:
        return message ?? 'Too many requests.';
      case 500:
        return message ?? 'Internal server error.';
      default:
        return 'Oops something went wrong!';
    }
  }

  @override
  String toString() => message;
}
