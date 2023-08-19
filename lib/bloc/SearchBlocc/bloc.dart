import 'package:bloc/bloc.dart';
import 'package:the_movie_database/data/genre.dart';

import '../../data/movie.dart';
import '../../helper_functions/extractingFromJson.dart';
import '../../services/api_service.dart';
import 'event.dart';
import 'state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiService apiService;

  SearchBloc(this.apiService) : super(InitialState()) {
    on<SearchEvent>((event, emit) async {
      if (event is LoadDataEvent) {
        print('debugging: LoadDataEvent');
        emit(LoadingState());
        final searchRes = await apiService.fetchSearchMovieResults(event.query);
        final genreRes = await apiService.fetchMoviesCategories();
        final searchMoviesResponse = extractingFromJson<MovieResponse>(
            searchRes, MovieResponse.fromJson);
        final genreResponse = extractingFromJson<GenresResponse>(
            genreRes, GenresResponse.fromJson);
        if (searchMoviesResponse.results.isEmpty) {
          emit(EmptyState());
        } else {
          emit(LoadedState(searchMoviesResponse, genreResponse));
        }
      }
    });
    // add(LoadDataEvent());
  }
}
