import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RecommendationsContent extends StatelessWidget {
  const RecommendationsContent({
    required this.onTap,
    required this.posterPath,
    super.key,
  });

  final VoidCallback onTap;
  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: CachedNetworkImage(
            imageUrl: 'https://image.tmdb.org/t/p/w500$posterPath',
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
