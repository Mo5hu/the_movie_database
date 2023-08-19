import 'package:flutter/material.dart';
import 'package:the_movie_database/data/genre.dart';

import '../data/movie.dart';
import 'movie_card.dart';

class SearchMovieResults extends StatelessWidget {
  const SearchMovieResults(
      {super.key,
      required this.searchMovieResponse,
      required this.sectionHeader,
      required this.genreResponse});

  final MovieResponse searchMovieResponse;
  final String sectionHeader;
  final GenresResponse genreResponse;

  @override
  Widget build(BuildContext context) {
    List<Widget> movies = [];
    for (var movie in searchMovieResponse.results) {
      movies.add(MovieCard(
          genreName: movie.genreIds.isEmpty
              ? "Unknown"
              : _findGenreNameById(movie.genreIds.first),
          movie: movie));
    }

    return Column(
      children: [
        Row(
          children: [
            Text(
              sectionHeader,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 560,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150, // Adjust the max width of each item
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.5, // Adjust the aspect ratio as needed
            ),
            itemCount: searchMovieResponse.results.length,
            itemBuilder: (context, index) {
              final movie = searchMovieResponse.results[index];
              return MovieCard(
                  movie: movie,
                  genreName: movie.genreIds.isEmpty
                      ? "Unknown"
                      : _findGenreNameById(movie.genreIds.first));
            },
          ),
        ),
      ],
    );
  }

  String _findGenreNameById(int genreId) {
    Genre? genre =
        genreResponse.genres.firstWhere((genre) => genre.id == genreId);
    return genre.name;
  }
}
