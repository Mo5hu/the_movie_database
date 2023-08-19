import 'package:flutter/material.dart';
import 'package:the_movie_database/data/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final String genraName;

  const MovieCard({Key? key, required this.movie, required this.genraName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          width: 120, // Adjust the width as needed
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
                10), // Apply the same borderRadius to ClipRRect
            child: Image.network(
              movie.posterPath == null
                  ? 'https://www.flicks.co.za/img/placeholders/poster-placeholder.jpg'
                  : 'https://image.tmdb.org/t/p/w185${movie.posterPath}',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          limitTextTo20Characters(movie.title),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 2),
        Text(
          "${movie.voteAverage.toString()} • $genraName",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }

  String limitTextTo20Characters(String text) {
    if (text.length <= 20) {
      return text;
    } else {
      return text.substring(0, 15) + '...';
    }
  }
}
