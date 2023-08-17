import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaticRow extends StatelessWidget {
  const StaticRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Reem  👋 ',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "Bring Popcorn, it's a movie time.",
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            child: Image.network(
              'https://www.spatial.io/_next/image?url=https%3A%2F%2Frenderapi.s3.amazonaws.com%2FphW8j2i5R.png&w=640&q=75',
              width: 100, // Adjust width as needed
              height: 100, // Adjust height as needed
              fit: BoxFit.cover, // Choose a fit option that suits your layout
            ),
          ),
        )
      ],
    );
  }
}
