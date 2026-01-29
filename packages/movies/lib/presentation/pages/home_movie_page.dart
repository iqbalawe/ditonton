import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/movies.dart';

class HomeMoviePage extends StatefulWidget {
  const HomeMoviePage({super.key});

  @override
  State<HomeMoviePage> createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, searchMovieRoute);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) =>
                  GetIt.instance<NowPlayingCubit>()..fetchNowPlayingMovies(),
            ),
            BlocProvider(
              create: (_) =>
                  GetIt.instance<PopularCubit>()..fetchPopularMovies(),
            ),
            BlocProvider(
              create: (_) =>
                  GetIt.instance<TopRatedCubit>()..fetchTopRatedMovies(),
            ),
          ],
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Now Playing', style: heading6),
                BlocBuilder<NowPlayingCubit, NowPlayingState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (msg) => const Text('Failed'),
                      loaded: (movies) => HorizontalItemList(
                        items: movies,
                        onPosterUrl: (movie) => movie.posterPath ?? '',
                        onTap: (movie) {
                          Navigator.pushNamed(
                            context,
                            movieDetailRoute,
                            arguments: movie.id,
                          );
                        },
                      ),
                    );
                  },
                ),
                SubHeading(
                  title: 'Popular',
                  onTap: () => Navigator.pushNamed(context, popularMoviesRoute),
                ),
                BlocBuilder<PopularCubit, PopularState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (msg) => const Text('Failed'),
                      loaded: (movies) => HorizontalItemList(
                        items: movies,
                        onPosterUrl: (movie) => movie.posterPath ?? '',
                        onTap: (movie) {
                          Navigator.pushNamed(
                            context,
                            movieDetailRoute,
                            arguments: movie.id,
                          );
                        },
                      ),
                    );
                  },
                ),
                SubHeading(
                  title: 'Top Rated',
                  onTap: () =>
                      Navigator.pushNamed(context, topRatedMoviesRoute),
                ),
                BlocBuilder<TopRatedCubit, TopRatedState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (msg) => const Text('Failed'),
                      loaded: (movies) => HorizontalItemList(
                        items: movies,
                        onPosterUrl: (movie) => movie.posterPath ?? '',
                        onTap: (movie) {
                          Navigator.pushNamed(
                            context,
                            movieDetailRoute,
                            arguments: movie.id,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
