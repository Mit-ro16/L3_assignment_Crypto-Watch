import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_event.dart';
import 'signup_state.dart';
import 'package:assignment/domain/usecases/auth_usecase.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthUsecase authUsecase;

  SignupBloc(this.authUsecase) : super(SignupInitial()) {
    on<SignUpEvent>((event, emit) async {
      emit(SignupLoading());

      final result = await authUsecase.signup(event.email, event.password);

      result.fold(
        (failure) => emit(SignupFailure(failure.message)),
        (_) => emit(SignupSuccess()),
      );
    });
  }
}
