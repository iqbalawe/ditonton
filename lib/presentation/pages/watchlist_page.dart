import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/movies.dart';
import 'package:tv_series/tv_series.dart';

import '../../injection.dart' as di;

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              di.locator<WatchlistMoviesCubit>()..fetchWatchlistMovies(),
        ),
        BlocProvider(
          create: (_) =>
              GetIt.instance<WatchlistTVSeriesCubit>()
                ..fetchWatchlistTVSeries(),
        ),
      ],
      child: const WatchlistView(),
    );
  }
}

class WatchlistView extends StatefulWidget {
  const WatchlistView({super.key});

  @override
  State<WatchlistView> createState() => _WatchlistViewState();
}

class _WatchlistViewState extends State<WatchlistView> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<WatchlistMoviesCubit>().fetchWatchlistMovies();
    context.read<WatchlistTVSeriesCubit>().fetchWatchlistTVSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Watchlist')),
      body: const DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorColor: mikadoYellow,
              tabs: [
                Tab(text: 'Movies'),
                Tab(text: 'TV Series'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [WatchlistMoviesPage(), WatchlistTVSeriesPage()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
