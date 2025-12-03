import 'package:equatable/equatable.dart';
import 'package:assignment/domain/entities/crypto_entity.dart';

abstract class DiscoverState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DiscoverInitial extends DiscoverState {}

class DiscoverLoading extends DiscoverState {}

class DiscoverLoaded extends DiscoverState {
  final List<CryptoEntity> coins;
  DiscoverLoaded(this.coins);

  @override
  List<Object?> get props => [coins];
}

class DiscoverError extends DiscoverState {
  final String message;
  DiscoverError(this.message);

  @override
  List<Object?> get props => [message];
}
