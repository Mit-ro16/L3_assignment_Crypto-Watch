import 'package:assignment/data/datasources/remote/crypto_remote_datasource.dart';
import 'package:assignment/domain/entities/crypto_entity.dart';
import 'package:assignment/domain/repository/crypto_repository.dart';


class CryptoRepositoryImpl implements CryptoRepository {
  final CryptoRemoteDataSource remote;

  CryptoRepositoryImpl(this.remote);

  @override
  Future<List<CryptoEntity>> getMarketList() async {
    final list = await remote.fetchMarket();
    return list
        .map((e) => CryptoEntity(
              id: e.id,
              symbol: e.symbol,
              name: e.name,
              image: e.image,
              price: e.currentPrice,
              change24: e.priceChange24h,
            ))
        .toList();
  }
}
