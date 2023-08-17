import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_database/bloc/NavigationBloc/bloc.dart';
import 'package:the_movie_database/screens/home_screen.dart';
import 'package:the_movie_database/screens/hydrated_app.dart';
import 'package:the_movie_database/screens/movie_detail_screen.dart';
import 'package:the_movie_database/screens/saved_movie_screen.dart';
import 'package:the_movie_database/screens/search_movie_screen.dart';
import 'package:the_movie_database/services/api_service.dart';

void main() {
  final apiService = ApiService();
  final navigationBloc = NavigationBloc(apiService);

  runApp(MyApp(navigationBloc));
}

class MyApp extends StatelessWidget {
  final NavigationBloc navigationBloc;

  MyApp(this.navigationBloc);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Movie Db',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider.value(
              value: navigationBloc,
              child: const HydratedApp(),
            ),
        '/home': (context) => const HomeScreen(),
        '/saved': (context) => const SavedMovieScreen(),
        '/search': (context) => const SearchMovieScreen(),
        '/movie-detail': (context) => const MovieDetailScreen(),
      },
    );
  }
}
