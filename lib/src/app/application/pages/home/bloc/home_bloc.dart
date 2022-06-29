import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:tyba_test/src/app/domain/value_objects/searchText.dart';

import '../../../../domain/use_cases/search_restaurants_use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required SearchRestaurantsUseCase searchRestaurantsUseCase,
  })  : _searchRestaurantsUseCase = searchRestaurantsUseCase,
        super(const HomeState()) {
    on<SearchBoxChanged>(_onSearchBoxChanged);
    on<SearchSubmitted>(_onSubmitted);
  }

  final SearchRestaurantsUseCase _searchRestaurantsUseCase;

  void _onSearchBoxChanged(
    SearchBoxChanged event,
    Emitter<HomeState> emit,
  ) {
    final searchText = SearchText.dirty(event.searchText);
    emit(state.copyWith(
      searchText: searchText,
      restaurants: [],
      status: Formz.validate([searchText, state.searchText]),
    ));
  }

  void _onSubmitted(
    SearchSubmitted event,
    Emitter<HomeState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        List list = await _searchRestaurantsUseCase.invoke(
          searchText: state.searchText.value,
        );
        emit(state.copyWith(restaurants: list));
      } catch (_) {
        emit(state.copyWith(restaurants: []));
      }
    }
  }
}
