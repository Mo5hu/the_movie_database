import 'package:flutter/material.dart';
import 'package:the_movie_database/constants/app_colors.dart';
import 'package:the_movie_database/data/genre.dart';

class GenreCard extends StatelessWidget {
  final Genre genre;

  const GenreCard({Key? key, required this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> genreEmojis = {
      'Action': '🎬',
      'Adventure': '⛰️',
      // Add more genre emojis here
    };

    return Column(
      children: [
        Container(
          height: 55,
          width: 55, // Adjust the width as needed
          decoration: BoxDecoration(
            color: AppColors.accentColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                genreEmojis[genre.name] ?? '❓',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(
          genre.name,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
