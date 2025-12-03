import 'package:assignment/data/models/crypto_model.dart';
import 'package:dio/dio.dart';


abstract class CryptoRemoteDataSource {
  Future<List<CryptoModel>> fetchMarket();
}

class CryptoRemoteDataSourceImpl implements CryptoRemoteDataSource {
  final Dio dio;
  CryptoRemoteDataSourceImpl(this.dio);

  @override
  Future<List<CryptoModel>> fetchMarket() async {
    final response = await dio.get(
      "/coins/markets",
      queryParameters: {
        "vs_currency": "usd",
        "category": "layer-1",
        "price_change_percentage": "24h",
      },
    );

    final list = response.data as List;
    return list.map((e) => CryptoModel.fromJson(e)).toList();
  }
}
