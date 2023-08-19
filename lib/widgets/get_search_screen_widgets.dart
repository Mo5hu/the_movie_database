import 'package:flutter/material.dart';
import 'package:the_movie_database/widgets/search_movie_results.dart';

import '../bloc/SearchBlocc/state.dart';

Widget getSearchScreenWidgets(SearchState state) {
  if (state is InitialState) {
    return const Center(
      child: Text('Search for Movies'),
    );
  } else if (state is EmptyState) {
    return const Center(
      child: Text('No Results'),
    );
  } else if (state is LoadingState) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  } else if (state is LoadedState) {
    return SearchMovieResults(
        sectionHeader: "Search Results",
        genreResponse: state.genreResponse,
        searchMovieResponse: state.movieResponse);
  } else {
    return const Center(child: Text('Unknown State'));
  }
}
