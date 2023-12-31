import 'package:flutter/material.dart';
import 'package:the_movie_database/data/genre.dart';

import '../data/movie.dart';
import 'movie_card.dart';

class MovieRow extends StatelessWidget {
  const MovieRow(
      {super.key,
      required this.popularMovieResponse,
      required this.sectionHeader,
      required this.genreResponse});

  final MovieResponse popularMovieResponse;
  final String sectionHeader;
  final GenresResponse genreResponse;

  @override
  Widget build(BuildContext context) {
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
          height: 220, // Adjust the height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: popularMovieResponse.results.length,
            itemBuilder: (context, index) {
              final movie = popularMovieResponse.results[index];
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: MovieCard(
                    movie: movie,
                    genreName: movie.genreIds.isEmpty
                        ? "Unknown"
                        : _findGenreNameById(movie.genreIds.first)),
              );
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
