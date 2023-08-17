import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/genre.dart';
import 'genre_card.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({
    super.key,
    required this.genreResponse,
  });

  final GenresResponse genreResponse;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Category',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            TextButton(
              onPressed: () {},
              child: const Row(
                children: [Text('See All'), Icon(Icons.chevron_right_outlined)],
              ),
            )
          ],
        ),
        SizedBox(
            height: 80, // Adjust the height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: genreResponse.genres.length,
              itemBuilder: (context, index) {
                final genre = genreResponse.genres[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GenreCard(genre: genre),
                );
              },
            ))
      ],
    );
  }
}
