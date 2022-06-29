import 'package:tyba_test/src/app/data/data_source/home_data_source/home_remote_data_source.dart';
import 'package:tyba_test/src/app/domain/models/resstaurant_model.dart';
import 'package:tyba_test/src/app/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl({required HomeRemoteDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;

  @override
  Future<List<RestaurantModel>> getRestaurants({required String searchText}) {
    var nameList = ['Mis delicias', 'los panes', 'pollos el pollo', 'las naranjas', 'quesadillo'];
    var cityList = ["Bogotá", "Cali", "Medellín"];

    return Future.value(
      List<RestaurantModel>.generate(
        10,
        (index) => RestaurantModel(
            name: (nameList..shuffle()).first, city: (cityList..shuffle()).first, description: "La descripción"),
      ),
    );
  }
}
