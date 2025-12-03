import 'package:assignment/core/network/failure.dart';
import 'package:assignment/domain/entities/user_entity.dart';
import 'package:assignment/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';


class AuthUsecase {
  final AuthRepository repository;

  AuthUsecase({required this.repository});
  Future<Either<Failure, UserEntity>> signup(String email, String password) {
    return repository.signup(email, password);
  }

  Future<Either<Failure, UserEntity>> signin(String email, String password) {
    return repository.signin(email, password);
  }
}