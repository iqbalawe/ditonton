import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_series/tv_series.dart';

class TVSeriesDetailPage extends StatefulWidget {
  final int id;
  const TVSeriesDetailPage({super.key, required this.id});

  @override
  State<TVSeriesDetailPage> createState() => _TVSeriesDetailPageState();
}

class _TVSeriesDetailPageState extends State<TVSeriesDetailPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              GetIt.instance<TVSeriesDetailCubit>()
                ..fetchTVSeriesDetail(widget.id),
        ),
        BlocProvider(
          create: (_) =>
              GetIt.instance<TVSeriesRecommendationsCubit>()
                ..fetchTVSeriesRecommendations(widget.id),
        ),
        BlocProvider(
          create: (_) =>
              GetIt.instance<WatchlistTVSeriesStatusCubit>()
                ..loadWatchlistStatus(widget.id),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<TVSeriesDetailCubit, TVSeriesDetailState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (msg) => Center(child: Text(msg)),
              loaded: (tvSeries) {
                return SafeArea(
                  child: DetailContent(
                    title: tvSeries.name,
                    overview: tvSeries.overview,
                    posterPath: tvSeries.posterPath,
                    voteAverage: tvSeries.voteAverage,
                    genres: tvSeries.genres,
                    isTVSeries: true,
                    seasonsList: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Seasons', style: heading6),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: tvSeries.seasons.length,
                            itemBuilder: (context, index) {
                              final season = tvSeries.seasons[index];
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Card(
                                  child: Container(
                                    width: 100,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            child: season.posterPath != null
                                                ? CachedNetworkImage(
                                                    imageUrl:
                                                        'https://image.tmdb.org/t/p/w500${season.posterPath}',
                                                    fit: BoxFit.cover,
                                                    width: double.infinity,
                                                    placeholder:
                                                        (
                                                          context,
                                                          url,
                                                        ) => const Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            const Icon(
                                                              Icons.movie,
                                                            ),
                                                  )
                                                : const Center(
                                                    child: Icon(
                                                      Icons.image_not_supported,
                                                    ),
                                                  ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          season.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${season.episodeCount} Eps',
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                    watchlistButton:
                        BlocConsumer<
                          WatchlistTVSeriesStatusCubit,
                          WatchlistTVSeriesStatusState
                        >(
                          listener: (context, state) {
                            state.maybeWhen(
                              message: (msg) => ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text(msg))),
                              orElse: () {},
                            );
                          },
                          builder: (context, state) {
                            final isAdded = state.maybeWhen(
                              isAdded: (val) => val,
                              orElse: () => false,
                            );

                            return ContentWatchlistButton(
                              isAdded: isAdded,
                              onPressed: () async {
                                if (!isAdded) {
                                  await context
                                      .read<WatchlistTVSeriesStatusCubit>()
                                      .addWatchlist(tvSeries);
                                } else {
                                  await context
                                      .read<WatchlistTVSeriesStatusCubit>()
                                      .removeFromWatchlist(tvSeries);
                                }
                              },
                            );
                          },
                        ),
                    recommendations:
                        BlocBuilder<
                          TVSeriesRecommendationsCubit,
                          TVSeriesRecommendationsState
                        >(
                          builder: (context, state) {
                            return state.when(
                              initial: () => const SizedBox(),
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              error: (_) => const SizedBox(),
                              empty: () => const Text("No Recommendations"),
                              loaded: (movies) {
                                return RecommendationList(
                                  recommendations: movies,
                                  onTap: (id) {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      tvSeriesDetailRoute,
                                      arguments: id,
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
