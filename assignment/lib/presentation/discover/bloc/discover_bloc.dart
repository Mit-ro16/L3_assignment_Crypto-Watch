import 'package:flutter_bloc/flutter_bloc.dart';
import 'discover_event.dart';
import 'discover_state.dart';
import 'package:assignment/domain/usecases/get_market_list_usecase.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final GetMarketListUseCase getMarket;

  DiscoverBloc(this.getMarket) : super(DiscoverInitial()) {
    on<LoadMarketEvent>(_loadMarket);
  }

  Future<void> _loadMarket(
  LoadMarketEvent event,
  Emitter<DiscoverState> emit,
) async {
  emit(DiscoverLoading());

  final result = await getMarket();  

  result.fold(
    (failure) => emit(DiscoverError(failure.message)),
    (data) => emit(DiscoverLoaded(data)),
  );
}

}
