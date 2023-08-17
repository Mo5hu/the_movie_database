// States
import 'package:the_movie_database/data/genre.dart';
import 'package:the_movie_database/data/movie.dart';

abstract class NavigationState {}

class HomeScreenState extends NavigationState {
  GenresResponse genre;
  MovieResponse popularMovies;
  MovieResponse upcomingMovies;

  HomeScreenState(this.genre, this.popularMovies, this.upcomingMovies);
}

class SearchScreenState extends NavigationState {}

class SavedScreenState extends NavigationState {}

class LoadingState extends NavigationState {}

class ErrorState extends NavigationState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}
