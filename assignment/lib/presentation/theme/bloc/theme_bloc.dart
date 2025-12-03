import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_event.dart';
import 'theme_state.dart';
import 'package:assignment/domain/usecases/theme_usecase.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeUsecase usecase;

  ThemeBloc(this.usecase) : super(ThemeState(isDark: false)) {
    on<LoadThemeEvent>((event, emit) {
      final saved = usecase.loadTheme();
      emit(ThemeState(isDark: saved));
    });

    on<ToggleThemeEvent>((event, emit) async {
      await usecase.toggleTheme(event.isDark);
      emit(ThemeState(isDark: event.isDark));
    });
  }
}
