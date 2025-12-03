import '../entities/crypto_entity.dart';
import '../repository/crypto_repository.dart';

class GetMarketListUsecase {
  final CryptoRepository repo;
  GetMarketListUsecase(this.repo);

  Future<List<CryptoEntity>> call() => repo.getMarketList();
}
