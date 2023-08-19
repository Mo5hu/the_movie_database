// States

import 'package:the_movie_database/data/genre.dart';
import 'package:the_movie_database/data/movie.dart';

abstract class SearchState {}

class InitialState extends SearchState {}

class LoadingState extends SearchState {}

class EmptyState extends SearchState {}

class LoadedState extends SearchState {
  final MovieResponse movieResponse;
  final GenresResponse genreResponse;
  LoadedState(this.movieResponse, this.genreResponse);
}

class ErrorState extends SearchState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}
