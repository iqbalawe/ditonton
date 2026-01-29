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
