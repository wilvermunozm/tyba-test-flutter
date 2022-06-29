import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyba_test/src/app/application/pages/home/bloc/home_bloc.dart';
import 'package:tyba_test/src/app/application/pages/home/widgets/restaurant_item.dart';
import 'package:tyba_test/src/app/application/utils/color_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (_, state) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade900,
          title: SizedBox(
            height: 38,
            child: TextField(
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
              onChanged: (value) {
                context.read<HomeBloc>().add(SearchBoxChanged(value));
                context.read<HomeBloc>().add(const SearchSubmitted());
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.zero,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                filled: true,
                fillColor: Colors.grey[850],
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                ),
                hintText: 'Buscar restaurantes',
              ),
            ),
          ),
        ),
        body: state.restaurants.isEmpty
            ? const Center(
                child: Text(
                  'no se encontraron restaurantes ....',
                  style: TextStyle(
                    color: kColorBlack,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: state.restaurants.length,
                itemBuilder: (context, index) {
                  return RestaurantItem(restaurant: state.restaurants[index]);
                },
              ),
      );
    });
  }
}
