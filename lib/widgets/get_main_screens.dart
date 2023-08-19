import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_database/bloc/NavigationBloc/state.dart';
import 'package:the_movie_database/bloc/SearchBlocc/bloc.dart';
import 'package:the_movie_database/screens/saved_movie_screen.dart';
import 'package:the_movie_database/screens/home_screen.dart';
import 'package:the_movie_database/screens/search_movie_screen.dart';
import 'package:the_movie_database/services/api_service.dart';

import 'loading_screen.dart';

Widget getMainScreens(NavigationState state, ApiService apiService) {
  if (state is HomeScreenState) {
    return HomeScreen(
        genreResponse: state.genre,
        popularMovieResponse: state.popularMovies,
        upcomingMovieResponse:
            state.upcomingMovies); // Implement your Home screen content here
  } else if (state is SearchScreenState) {
    return BlocProvider(
      create: (context) => SearchBloc(apiService),
      child: SearchMovieScreen(),
    ); // Implement your Search screen content here
  } else if (state is SavedScreenState) {
    return const SavedMovieScreen(); // Implement your Saved screen content here
  } else if (state is LoadingState) {
    return const LoadingScreen();
  } else {
    return const Center(child: Text('Unknown State'));
  }
}
