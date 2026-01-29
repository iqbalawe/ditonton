import 'package:core/core.dart';
import 'package:flutter/material.dart';

class RecommendationList extends StatelessWidget {
  final List<dynamic> recommendations;
  final Function(int id) onTap;

  const RecommendationList({
    super.key,
    required this.recommendations,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (recommendations.isEmpty) {
      return const Text("No Recommendations");
    }

    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          final item = recommendations[index];
          return RecommendationsContent(
            onTap: () => onTap(item.id),
            posterPath: item.posterPath,
          );
        },
      ),
    );
  }
}
