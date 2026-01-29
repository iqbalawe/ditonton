import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_series/tv_series.dart';

class HomeTVSeriesPage extends StatefulWidget {
  const HomeTVSeriesPage({super.key});

  @override
  State<HomeTVSeriesPage> createState() => _HomeTVSeriesPageState();
}

class _HomeTVSeriesPageState extends State<HomeTVSeriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, searchTVSeriesRoute);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                GetIt.instance<OnTheAirCubit>()..fetchOnTheAirTVSeries(),
          ),
          BlocProvider(
            create: (_) =>
                GetIt.instance<PopularTVSeriesCubit>()..fetchPopularTVSeries(),
          ),
          BlocProvider(
            create: (_) =>
                GetIt.instance<TopRatedTVSeriesCubit>()
                  ..fetchTopRatedTVSeries(),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('On The Air', style: heading6),
                BlocBuilder<OnTheAirCubit, OnTheAirState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (msg) => const Text('Failed'),
                      loaded: (tvSeries) => HorizontalItemList(
                        items: tvSeries,
                        onPosterUrl: (tvSeries) => tvSeries.posterPath ?? '',
                        onTap: (tvSeries) {
                          Navigator.pushNamed(
                            context,
                            tvSeriesDetailRoute,
                            arguments: tvSeries.id,
                          );
                        },
                      ),
                    );
                  },
                ),
                SubHeading(
                  title: 'Popular',
                  onTap: () =>
                      Navigator.pushNamed(context, popularTVSeriesRoute),
                ),
                BlocBuilder<PopularTVSeriesCubit, PopularTVSeriesState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (msg) => const Text('Failed'),
                      loaded: (tvSeries) => HorizontalItemList(
                        items: tvSeries,
                        onPosterUrl: (tvSeries) => tvSeries.posterPath ?? '',
                        onTap: (tvSeries) {
                          Navigator.pushNamed(
                            context,
                            tvSeriesDetailRoute,
                            arguments: tvSeries.id,
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
                BlocBuilder<TopRatedTVSeriesCubit, TopRatedTVSeriesState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (msg) => const Text('Failed'),
                      loaded: (tvSeries) => HorizontalItemList(
                        items: tvSeries,
                        onPosterUrl: (tvSeries) => tvSeries.posterPath ?? '',
                        onTap: (tvSeries) {
                          Navigator.pushNamed(
                            context,
                            tvSeriesDetailRoute,
                            arguments: tvSeries.id,
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
