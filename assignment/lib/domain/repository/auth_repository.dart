import 'package:assignment/core/network/failure.dart';
import 'package:assignment/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signup(String email, String password);
  Future<Either<Failure, UserEntity>> signin(String email, String password);
}
