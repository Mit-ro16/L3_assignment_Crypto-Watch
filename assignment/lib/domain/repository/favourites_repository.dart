abstract class FavouritesRepository {
  List<String> getFavouriteIds();
  Future<void> saveFavouriteIds(List<String> ids);
}
