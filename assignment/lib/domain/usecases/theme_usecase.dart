import 'package:assignment/domain/repository/theme_repository.dart';

class ThemeUsecase {
  final ThemeRepository repo;

  ThemeUsecase(this.repo);

  bool loadTheme() => repo.getTheme();

  Future<void> toggleTheme(bool value) => repo.saveTheme(value);
}
