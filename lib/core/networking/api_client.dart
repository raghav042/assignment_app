import 'package:dio/dio.dart';

import '../constant/network_status.dart';
import 'connectivity_service.dart';
import 'network_excecption.dart';

class ApiClient {
  final Dio dio;
  final ConnectivityService _connectivityService;

  ApiClient(this.dio, this._connectivityService);

  static Dio createDio() {
    final dio = Dio();
    return dio;
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final networkStatus = await _connectivityService.checkConnectivity();
    if (networkStatus == NetworkStatus.offline) {
      throw NetworkException(
        RequestOptions(path: path),
        message: 'No Internet Connection',
      );
    }

    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException {
      rethrow;
    }
  }
}
