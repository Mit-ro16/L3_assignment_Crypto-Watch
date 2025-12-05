import 'package:assignment/core/contants/api_constant.dart';
import 'package:assignment/core/contants/string_constants.dart';
import 'package:assignment/core/network/dio_client.dart';
import 'package:assignment/core/network/failure.dart';
import 'package:assignment/data/models/crypto_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class CryptoRemoteDataSource {
  Future<Either<Failure, List<CryptoModel>>> getMarketList();
}

class CryptoRemoteDataSourceImpl implements CryptoRemoteDataSource {
  final DioClient client;

  CryptoRemoteDataSourceImpl(this.client);

  @override
  Future<Either<Failure, List<CryptoModel>>> getMarketList() async {
    try {
      final response = await client.dio.get(
        ApiConstants.getMarketCoinsList,  
        queryParameters: {
          StringConstants.vsCurrency: StringConstants.usd,
          StringConstants.order: StringConstants.marketCapDesc,
          StringConstants.perPage: 20,
          StringConstants.page: 1,
          StringConstants.priceChangePercentage:
              StringConstants.priceChange1h24h,
        },
      );

      final data = response.data as List<dynamic>;

      final coins = data.map((e) => CryptoModel.fromJson(e)).toList();

      return Right(coins);
    } on DioException catch (e) {
      return Left(Failure(message: e.message ?? "Network Error"));
    } catch (e) {
      return Left(Failure(message: "Unexpected Error: $e"));
    }
  }
}
