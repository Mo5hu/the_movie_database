import 'package:flutter/material.dart';
import 'package:the_movie_database/data/genre.dart';
import 'package:the_movie_database/data/movie.dart';

import '../widgets/category_row.dart';
import '../widgets/movie_row.dart';
import '../widgets/static_row.dart';

class HomeScreen extends StatelessWidget {
  final GenresResponse genreResponse;
  final MovieResponse popularMovieResponse;
  final MovieResponse upcomingMovieResponse;

  const HomeScreen(
      {Key? key,
      required this.genreResponse,
      required this.popularMovieResponse,
      required this.upcomingMovieResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const StaticRow(),
          const SizedBox(height: 8),
          CategoryRow(genreResponse: genreResponse),
          const SizedBox(height: 8),
          MovieRow(
            popularMovieResponse: popularMovieResponse,
            sectionHeader: "Trending Movies",
            genreResponse: genreResponse,
          ),
          const SizedBox(height: 8),
          MovieRow(
            popularMovieResponse: upcomingMovieResponse,
            sectionHeader: "Upcoming Movies",
            genreResponse: genreResponse,
          )
        ],
      ),
    );
  }
}
