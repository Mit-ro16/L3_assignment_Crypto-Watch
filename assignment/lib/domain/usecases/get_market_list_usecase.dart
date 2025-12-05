import 'package:assignment/core/network/failure.dart';
import 'package:assignment/domain/entities/crypto_entity.dart';
import 'package:assignment/domain/repository/crypto_repository.dart';
import 'package:dartz/dartz.dart';

class GetMarketListUseCase {
  final CryptoRepository repository;

  GetMarketListUseCase(this.repository);

  Future<Either<Failure, List<CryptoEntity>>> call() {
    return repository.getMarketList();
  }
}