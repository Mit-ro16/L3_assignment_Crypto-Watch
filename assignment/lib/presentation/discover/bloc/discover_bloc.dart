import 'package:flutter_bloc/flutter_bloc.dart';
import 'discover_event.dart';
import 'discover_state.dart';
import 'package:assignment/domain/usecases/get_market_list_usecase.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final GetMarketListUsecase getMarket;

  DiscoverBloc(this.getMarket) : super(DiscoverInitial()) {
    on<LoadMarketEvent>(_loadMarket);
  }

  Future<void> _loadMarket(
      LoadMarketEvent event, Emitter<DiscoverState> emit) async {
    emit(DiscoverLoading());

    try {
      final data = await getMarket();
      emit(DiscoverLoaded(data));
    } catch (e) {
      emit(DiscoverError(e.toString()));
    }
  }
}
