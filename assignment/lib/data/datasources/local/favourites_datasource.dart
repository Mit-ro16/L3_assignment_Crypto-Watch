import 'package:hive/hive.dart';

abstract class FavouritesLocalDataSource {
  Future<void> saveFavourites(List<String> ids);
  List<String> getFavourites();
}

class FavouritesLocalDataSourceImpl implements FavouritesLocalDataSource {
  final Box favBox;

  FavouritesLocalDataSourceImpl(this.favBox);

  @override
  Future<void> saveFavourites(List<String> ids) async {
    await favBox.put('fav_ids', ids);
  }

  @override
  List<String> getFavourites() {
    return (favBox.get('fav_ids', defaultValue: <String>[]) as List).cast<String>();
  }
}
