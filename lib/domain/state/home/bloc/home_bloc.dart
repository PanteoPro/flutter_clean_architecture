import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:clean_arhitecture_example_app/domain/model/day.dart';
import 'package:clean_arhitecture_example_app/domain/repository/day_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DayRepository _dayRepository;
  HomeBloc({
    required DayRepository dayRepository,
  })  : _dayRepository = dayRepository,
        super(HomeInitial()) {
    on<HomeFetch>(_onFetch);
  }

  Future<void> _onFetch(HomeFetch event, Emitter<HomeState> state) async {
    if (state is! HomeLoading) {
      emit(HomeLoading());
      final day = await _dayRepository.getDay(latitude: event.latitude, longitude: event.longitude);
      emit(HomeLoaded(day: day));
    }
  }
}
