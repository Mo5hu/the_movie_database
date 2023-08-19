import 'package:flutter/material.dart';

import '../bloc/SearchBlocc/state.dart';
import 'movie_row.dart';

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
    return MovieRow(
        popularMovieResponse: state.movieResponse,
        sectionHeader: "Search Results",
        genreResponse: state.genreResponse);
  } else {
    return const Center(child: Text('Unknown State'));
  }
}
