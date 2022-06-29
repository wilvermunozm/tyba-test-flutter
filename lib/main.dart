import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tyba_test/src/app/application/pages/home/bloc/home_bloc.dart';
import 'package:tyba_test/src/app/application/pages/home/home_page.dart';
import 'package:tyba_test/src/app/application/pages/login/bloc/login_bloc.dart';
import 'package:tyba_test/src/app/application/pages/login/login_page.dart';
import 'package:tyba_test/src/app/application/utils/custom_theme.dart';
import 'package:tyba_test/src/app/data/data_source/home_data_source/home_remote_data_source.dart';
import 'package:tyba_test/src/app/data/data_source/user_data_source/user_local_data_source.dart';
import 'package:tyba_test/src/app/data/repositories/home_repository_impl.dart';
import 'package:tyba_test/src/app/data/repositories/user_repository_impl.dart';
import 'package:tyba_test/src/app/domain/use_cases/login_user_use_case.dart';
import 'package:tyba_test/src/app/domain/use_cases/search_restaurants_use_case.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginBloc(
            loginUseCase: LoginUserUseCase(
              userRepository: UserRepositoryImpl(localDataSource: UserLocalDataSource()),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => HomeBloc(
            searchRestaurantsUseCase: SearchRestaurantsUseCase(
              homeRepository: HomeRepositoryImpl(
                remoteDataSource: HomeRemoteDataSource(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getTheme(),
        initialRoute: "/login",
        routes: {
          '/home': (context) => const HomePage(),
          '/login': (context) => const LoginPage(),
        },
      ),
    );
  }
}
