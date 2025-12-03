import 'package:assignment/core/network/failure.dart';
import 'package:assignment/data/models/crypto_model.dart';
import 'package:dartz/dartz.dart';

abstract class CryptoRemoteDataSource {
  Future<Either<Failure, List<CryptoModel>>> fetchMarket();
}
