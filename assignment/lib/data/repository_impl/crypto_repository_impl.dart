import 'package:assignment/core/network/failure.dart';
import 'package:assignment/data/datasources/remote/crypto_remote_datasource.dart';

import 'package:assignment/domain/entities/crypto_entity.dart';
import 'package:assignment/domain/repository/crypto_repository.dart';
import 'package:dartz/dartz.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  final CryptoRemoteDataSource remote;

  CryptoRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<CryptoEntity>>> getMarketList() async {
    final result = await remote.getMarketList();

    return result.fold((failure) => Left(failure), (models) {
      final entities = models.map((m) {
        return CryptoEntity(
          id: m.id,
          symbol: m.symbol,
          name: m.name,
          image: m.image,
          price: m.currentPrice,
          change24: m.priceChange24h,
        );
      }).toList();

      return Right(entities);
    });
  }
}
