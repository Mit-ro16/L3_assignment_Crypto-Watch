import 'package:assignment/core/contants/string_constants.dart';
import 'package:assignment/core/network/failure.dart';
import 'package:assignment/data/datasources/local/auth_datasource.dart';
import 'package:assignment/domain/entities/user_entity.dart';
import 'package:assignment/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  bool validEmail(String email) {
    const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  @override
  Future<Either<Failure, UserEntity>> signup(
    String email,
    String password,
  ) async {
    try {
      if (!validEmail(email)) {
        return Left(Failure(message: StringConstants.validEmail));
      }

      final existing = dataSource.getUserPassword(email);
      if (existing != null) {
        return Left(Failure(message: "User already exists"));
      }

      await dataSource.saveUser(email, password);

      return Right(UserEntity(email: email));
    } catch (e) {
      return Left(Failure(message: "Registration failed"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signin(
    String email,
    String password,
  ) async {
    try {
      final savedPassword = dataSource.getUserPassword(email);

      if (savedPassword == null) {
        return Left(Failure(message: "User not found"));
      }

      if (savedPassword != password) {
        return Left(Failure(message: "Incorrect password"));
      }

      return Right(UserEntity(email: email));
    } catch (e) {
      return Left(Failure(message: "Login failed"));
    }
  }
}
