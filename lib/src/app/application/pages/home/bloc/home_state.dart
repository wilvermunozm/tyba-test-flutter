part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.restaurants = const [],
    this.searchText = const SearchText.pure(),
    this.status = FormzStatus.pure,
  });

  final List restaurants;
  final SearchText searchText;
  final FormzStatus status;

  HomeState copyWith({
    List? restaurants,
    SearchText? searchText,
    FormzStatus? status,
  }) {
    return HomeState(
      restaurants: restaurants ?? this.restaurants,
      searchText: searchText ?? this.searchText,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [restaurants, searchText];
}
