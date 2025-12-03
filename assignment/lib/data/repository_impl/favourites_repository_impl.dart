import 'package:assignment/data/datasources/local/favourites_datasource.dart';
import 'package:assignment/domain/repository/favourites_repository.dart';


class FavouritesRepositoryImpl implements FavouritesRepository {
  final FavouritesLocalDataSource local;

  FavouritesRepositoryImpl(this.local);

  @override
  List<String> getFavouriteIds() => local.getFavourites();

  @override
  Future<void> saveFavouriteIds(List<String> ids) {
    return local.saveFavourites(ids);
  }
}
