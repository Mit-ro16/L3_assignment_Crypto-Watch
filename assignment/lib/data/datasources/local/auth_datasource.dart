import 'package:hive/hive.dart';

class AuthDataSource {
  final Box usersBox;

  AuthDataSource(this.usersBox);

  Future<void> saveUser(String email, String password) async {
    await usersBox.put(email, password);
  }

  String? getUserPassword(String email) {
    return usersBox.get(email);
  }
}
