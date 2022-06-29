import 'package:tyba_test/src/app/domain/models/resstaurant_model.dart';
import 'package:tyba_test/src/app/domain/repository/home_repository.dart';

class SearchRestaurantsUseCase {
  final HomeRepository _homeRepository;

  SearchRestaurantsUseCase({required HomeRepository homeRepository}) : _homeRepository = homeRepository;

  Future<List<RestaurantModel>> invoke({required String searchText}) {
    return _homeRepository.getRestaurants(searchText: searchText);
  }
}
