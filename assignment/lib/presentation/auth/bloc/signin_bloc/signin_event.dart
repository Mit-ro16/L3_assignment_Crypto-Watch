import 'package:equatable/equatable.dart';

abstract class SigninEvent extends Equatable {
  const SigninEvent();
  @override
  List<Object?> get props => [];
}

class SignInEvent extends SigninEvent {
  final String email;
  final String password;
  const SignInEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
