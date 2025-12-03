import 'package:assignment/domain/usecases/auth_usecase.dart';
import 'package:assignment/presentation/auth/bloc/signin_bloc/signin_event.dart';
import 'package:assignment/presentation/auth/bloc/signin_bloc/signin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthUsecase authUsecase;

  SigninBloc(this.authUsecase) : super(SigninInitial()) {
    on<SignInEvent>((event, emit) async {
      emit(SigninLoading());

      final result = await authUsecase.signin(event.email, event.password);

      await result.fold(
        (failure) async {
          emit(SigninFailure(failure.message));
        },
        (entity) async {
          emit(SigninSuccess(message: entity.email));
        },
      );
    });
  }
}
