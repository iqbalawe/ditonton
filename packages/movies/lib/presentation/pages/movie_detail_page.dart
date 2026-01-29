import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/movies.dart';

class MovieDetailPage extends StatefulWidget {
  final int id;
  const MovieDetailPage({super.key, required this.id});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              GetIt.instance<MovieDetailCubit>()..fetchMovieDetail(widget.id),
        ),
        BlocProvider(
          create: (_) =>
              GetIt.instance<RecommendationsCubit>()
                ..fetchMovieRecommendations(widget.id),
        ),
        BlocProvider(
          create: (_) =>
              GetIt.instance<WatchlistStatusCubit>()
                ..loadWatchlistStatus(widget.id),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (msg) => Center(child: Text(msg)),
              loaded: (movie) {
                return SafeArea(
                  child: DetailContent(
                    title: movie.title,
                    overview: movie.overview,
                    posterPath: movie.posterPath,
                    voteAverage: movie.voteAverage,
                    genres: movie.genres,
                    runtime: movie.runtime,
                    watchlistButton: _buildWatchlistButton(movie),
                    recommendations: _buildRecommendations(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildWatchlistButton(MovieDetail movie) {
    return BlocConsumer<WatchlistStatusCubit, WatchlistStatusState>(
      listener: (context, state) {
        state.maybeWhen(
          message: (msg) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(msg)));
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final isAdded = state.maybeWhen(
          isAdded: (val) => val,
          orElse: () => false,
        );

        return FilledButton(
          onPressed: () async {
            if (!isAdded) {
              await context.read<WatchlistStatusCubit>().addWatchlist(movie);
            } else {
              await context.read<WatchlistStatusCubit>().removeFromWatchlist(
                movie,
              );
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              isAdded ? const Icon(Icons.check) : const Icon(Icons.add),
              const Text('Watchlist'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRecommendations() {
    return BlocBuilder<RecommendationsCubit, RecommendationsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_) => const SizedBox(),
          empty: () => const Text("No Recommendations"),
          loaded: (movies) {
            return SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          movieDetailRoute,
                          arguments: movie.id,
                        );
                      },
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
