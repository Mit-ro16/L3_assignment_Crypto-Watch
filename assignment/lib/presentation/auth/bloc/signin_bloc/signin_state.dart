import 'package:equatable/equatable.dart';

abstract class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object?> get props => [];
}

class SigninInitial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninSuccess extends SigninState {
  final String message;
  

  const SigninSuccess({
    required this.message,
    
  });

  @override
  List<Object?> get props => [message];
}

class SigninFailure extends SigninState {
  final String message;

  const SigninFailure(this.message);

  @override
  List<Object?> get props => [message];
}
