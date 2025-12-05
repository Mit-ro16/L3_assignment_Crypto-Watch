import 'package:assignment/core/contants/api_constant.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient({required String apiKey})
    : dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          headers: {"Accept": "application/json"},
        ),
      ) {
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<Response> get(String endpoint, {Map<String, dynamic>? query}) async {
    try {
      return await dio.get(endpoint, queryParameters: query);
    } on DioException catch (e) {
      
      rethrow;
    }
  }
}
