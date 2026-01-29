import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies.dart';

class WatchlistMoviesPage extends StatelessWidget {
  const WatchlistMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistMoviesCubit, WatchlistMoviesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (msg) => Center(child: Text(msg)),
          empty: () =>
              const Center(child: Text("You don't have watchlist yet")),
          loaded: (movies) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MovieCard(movie);
              },
              itemCount: movies.length,
            );
          },
        );
      },
    );
  }
}
