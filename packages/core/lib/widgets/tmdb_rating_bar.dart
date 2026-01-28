import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TmdbRatingBar extends StatelessWidget {
  const TmdbRatingBar({
    required this.rating,
    required this.ratingText,
    super.key,
  });

  final double rating;
  final String ratingText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: rating,
          itemCount: 5,
          itemBuilder: (context, index) =>
              const Icon(Icons.star, color: kMikadoYellow),
          itemSize: 24,
        ),
        Text(ratingText),
      ],
    );
  }
}
