part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SearchBoxChanged extends HomeEvent {
  const SearchBoxChanged(this.searchText);

  final String searchText;

  @override
  List<Object> get props => [searchText];
}

class SearchSubmitted extends HomeEvent {
  const SearchSubmitted();
}
