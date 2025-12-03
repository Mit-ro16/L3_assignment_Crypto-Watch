import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
  @override
  List<Object?> get props => [];
}

class SignUpEvent extends SignupEvent {
  final String email;
  final String password;
  const SignUpEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
