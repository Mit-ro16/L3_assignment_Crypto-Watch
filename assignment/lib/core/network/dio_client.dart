import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient(String apiKey)
      : dio = Dio(
          BaseOptions(
            baseUrl: "https://pro-api.coingecko.com/api/v3",
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 15),
          ),
        ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["x-cg-pro-api-key"] = apiKey;
          return handler.next(options);
        },
      ),
    );
  }
}
