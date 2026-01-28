import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({
    required this.posterPath,
    required this.title,
    required this.genres,
    required this.runtime,
    required this.voteAverage,
    required this.overview,
    this.isAddedWatchlist = false,
    this.isTVSeries = false,
    super.key,
  });

  final String posterPath;
  final String title;
  final List<Genre> genres;
  final int runtime;
  final double voteAverage;
  final String overview;
  final bool isAddedWatchlist;
  final bool isTVSeries;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500$posterPath',
          width: screenWidth,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title, style: kHeading5),
                            FilledButton(
                              onPressed: () async {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  isAddedWatchlist
                                      ? const Icon(Icons.check)
                                      : const Icon(Icons.add),
                                  const Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(showGenres(genres)),
                            isTVSeries
                                ? const SizedBox.shrink()
                                : Text(_showDuration(runtime)),
                            TmdbRatingBar(
                              rating: voteAverage / 2,
                              ratingText: '$voteAverage',
                            ),
                            const SizedBox(height: 16),
                            Text('Overview', style: kHeading6),
                            Text(overview),
                            const SizedBox(height: 16),
                            Text('Recommendations', style: kHeading6),
                            // TODO: Call item list and show recommendations
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            minChildSize: 0.25,
          ),
        ),
        const NavigateBackButton(),
      ],
    );
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
