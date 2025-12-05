import 'package:assignment/core/network/failure.dart';
import 'package:assignment/data/datasources/remote/crypto_remote_datasource.dart';
import 'package:assignment/domain/entities/crypto_entity.dart';
import 'package:assignment/domain/repository/crypto_repository.dart';
import 'package:dartz/dartz.dart';


class CryptoRepositoryImpl implements CryptoRepository {
  final CryptoRemoteDataSource remoteDataSource;

  CryptoRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<CryptoEntity>>> getMarketList() async {
    final result = await remoteDataSource.getMarketList();

    return result.map((list) => list.map((e) => e as CryptoEntity).toList());
  }
}