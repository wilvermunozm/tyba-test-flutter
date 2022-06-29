import 'package:flutter/material.dart';
import 'package:tyba_test/src/app/domain/models/resstaurant_model.dart';

class RestaurantItem extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantItem({
    required this.restaurant,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(restaurant.name),
      subtitle: Text(restaurant.description),
      trailing: Text(restaurant.city),
    );
  }
}
