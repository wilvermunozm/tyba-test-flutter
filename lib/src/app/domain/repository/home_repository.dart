import 'package:tyba_test/src/app/domain/models/resstaurant_model.dart';

abstract class HomeRepository {
  Future<List<RestaurantModel>> getRestaurants({required String searchText});
}
