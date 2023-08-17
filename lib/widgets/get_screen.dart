import 'package:flutter/material.dart';
import 'package:the_movie_database/bloc/NavigationBloc/state.dart';
import 'package:the_movie_database/screens/saved_movie_screen.dart';
import 'package:the_movie_database/screens/home_screen.dart';
import 'package:the_movie_database/screens/search_movie_screen.dart';

Widget getScreen(NavigationState state) {
  if (state is HomeScreenState) {
    return HomeScreen(
        genreResponse: state.genre,
        popularMovieResponse: state.popularMovies,
        upcomingMovieResponse:
            state.upcomingMovies); // Implement your Home screen content here
  } else if (state is SearchScreenState) {
    return const SearchMovieScreen(); // Implement your Search screen content here
  } else if (state is SavedScreenState) {
    return const SavedMovieScreen(); // Implement your Saved screen content here
  } else if (state is LoadingState) {
    return Expanded(child: Center(child: const CircularProgressIndicator()));
  } else {
    return const Center(child: Text('Unknown State'));
  }
}
