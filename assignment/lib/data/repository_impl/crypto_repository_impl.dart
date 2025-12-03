import 'package:assignment/core/network/dio_client.dart';
import 'package:assignment/core/network/failure.dart';
import 'package:assignment/data/datasources/remote/crypto_remote_datasource.dart';
import 'package:assignment/data/models/crypto_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CryptoRemoteDataSourceImpl implements CryptoRemoteDataSource {
  final DioClient client;

  CryptoRemoteDataSourceImpl(this.client);

  @override
  Future<Either<Failure, List<CryptoModel>>> fetchMarket() async {
    try {
      final response = await client.dio.get(
        "/coins/markets",
        queryParameters: {
          "vs_currency": "usd",
          "category": "layer-1",
          "order": "market_cap_desc",
          "price_change_percentage": "1h,24h",
        },
      );

      final list = response.data as List<dynamic>;

      final coins = list.map((e) => CryptoModel.fromJson(e)).toList();
      return Right(coins);
    } on DioException catch (e) {
      return Left(Failure(message: "Exception"));
    } catch (e) {
      return Left(Failure(message: "Unexpected error: $e"));
    }
  }
}
