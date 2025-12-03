import 'package:equatable/equatable.dart';

abstract class DiscoverEvent extends Equatable {
  @override
  List<Object?> get props => [];
}


class LoadMarketEvent extends DiscoverEvent {}
