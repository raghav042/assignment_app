import 'package:dio/dio.dart';

class NetworkException extends DioException {
  NetworkException(RequestOptions r, {String? message})
      : super(requestOptions: r, error: message);

  @override
  String toString() {
    return error is String ? error as String : 'No Internet Connection';
  }
}
