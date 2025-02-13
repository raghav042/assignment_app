import 'package:dio/dio.dart';

class ApiClient {
  const ApiClient(this.dio);
  final Dio dio;

  static Dio createDio() {
    final dio = Dio();
    return dio;
  }

  Future<Response> get(String path, {Map<String, dynamic>? parameters}) async {
    try {
      final response = await dio.get(path, queryParameters: parameters);
      return response;
    } on DioException {
      rethrow;
    }
  }
}
