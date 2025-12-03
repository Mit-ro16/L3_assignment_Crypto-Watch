import 'package:assignment/domain/entities/crypto_entity.dart';

abstract class CryptoRepository {
  Future<List<CryptoEntity>> getMarketList();
}
