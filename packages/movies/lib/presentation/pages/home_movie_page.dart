import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: const AssetImage('assets/circle-g.png'),
                backgroundColor: Colors.grey.shade900,
              ),
              accountName: const Text('Ditonton'),
              accountEmail: const Text('ditonton@dicoding.com'),
              decoration: BoxDecoration(color: Colors.grey.shade900),
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Movies'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.tv),
              title: const Text('TV Series'),
              onTap: () {
                Navigator.pushNamed(context, homeMovieRoute);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, watchlistMoviesRoute);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, aboutRoute);
              },
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
          ],
        ),
      ),
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
                  di.locator<NowPlayingCubit>()..fetchNowPlayingMovies(),
            ),
            BlocProvider(
              create: (_) => di.locator<PopularCubit>()..fetchPopularMovies(),
            ),
            BlocProvider(
              create: (_) => di.locator<TopRatedCubit>()..fetchTopRatedMovies(),
            ),
          ],
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Now Playing', style: heading6),
                // TODO: Show now playing movie from TMDB API
                SubHeading(
                  title: 'Popular',
                  onTap: () => Navigator.pushNamed(context, popularMoviesRoute),
                ),
                // TODO: Show popular movie from TMDB API
                SubHeading(
                  title: 'Top Rated',
                  onTap: () =>
                      Navigator.pushNamed(context, topRatedMoviesRoute),
                ),
                // TODO: Show top rated movie from TMDB API
              ],
            ),
          ),
        ),
      ),
    );
  }
}
