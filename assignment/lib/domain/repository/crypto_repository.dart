import 'package:assignment/core/network/failure.dart';
import 'package:assignment/domain/entities/crypto_entity.dart';
import 'package:dartz/dartz.dart';


abstract class CryptoRepository {
  Future<Either<Failure, List<CryptoEntity>>> getMarketList();
}