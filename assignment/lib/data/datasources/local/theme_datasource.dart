import 'package:hive/hive.dart';

class ThemeDataSource {
  final Box settingsBox;

  ThemeDataSource(this.settingsBox);

  bool getTheme() {
    return settingsBox.get('isDarkMode', defaultValue: false);
  }

  Future<void> saveTheme(bool isDark) async {
    await settingsBox.put('isDarkMode', isDark);
  }
}
