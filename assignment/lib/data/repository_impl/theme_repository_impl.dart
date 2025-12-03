import 'package:assignment/data/datasources/local/theme_datasource.dart';
import 'package:assignment/domain/repository/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeDataSource dataSource;

  ThemeRepositoryImpl(this.dataSource);

  @override
  bool getTheme() => dataSource.getTheme();

  @override
  Future<void> saveTheme(bool isDark) => dataSource.saveTheme(isDark);
}
