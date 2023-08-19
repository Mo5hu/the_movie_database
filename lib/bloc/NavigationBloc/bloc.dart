import 'package:bloc/bloc.dart';
import 'package:the_movie_database/bloc/NavigationBloc/event.dart';
import 'package:the_movie_database/bloc/NavigationBloc/state.dart';
import 'package:the_movie_database/data/genre.dart';
import 'package:the_movie_database/data/movie.dart';
import 'package:the_movie_database/services/api_service.dart';

import '../../helper_functions/extractingFromJson.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final ApiService apiService;

  NavigationBloc(this.apiService) : super(LoadingState()) {
    on<NavigationEvent>((event, emit) async {
      if (event is NavigateToHomeEvent) {
        print('debugging: To Home');
        emit(LoadingState());
        final genreRes = await apiService.fetchMoviesCategories();
        final popularMoviesRes = await apiService.fetchPopularMovies();
        final upcomingMoviesRes = await apiService.fetchUpcomingMovies();

        final genresResponse = extractingFromJson<GenresResponse>(
            genreRes, GenresResponse.fromJson);
        final popularMoviesResponse = extractingFromJson<MovieResponse>(
            popularMoviesRes, MovieResponse.fromJson);
        final upcomingMoviesResponse = extractingFromJson<MovieResponse>(
            upcomingMoviesRes, MovieResponse.fromJson);

        emit(HomeScreenState(
            genresResponse, popularMoviesResponse, upcomingMoviesResponse));
      } else if (event is NavigateToSavedEvent) {
        print('debugging: To Saved');
        emit(SavedScreenState());
      } else if (event is NavigateToSearchEvent) {
        emit(LoadingState());
        print('debugging: To Search');
        emit(SearchScreenState());
      } else if (event is LoadDataEvent) {
        print('debugging: To Loading');
        emit(LoadingState());
      }
    });
    add(NavigateToHomeEvent());
  }
}
