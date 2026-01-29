import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/movies.dart';

class TopRatedMoviesPage extends StatefulWidget {
  const TopRatedMoviesPage({super.key});

  @override
  State<TopRatedMoviesPage> createState() => _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState extends State<TopRatedMoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top Rated Movies')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (_) => GetIt.instance<TopRatedCubit>()..fetchTopRatedMovies(),
          child: BlocBuilder<TopRatedCubit, TopRatedState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox(),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (msg) => Center(child: Text(msg)),
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
          ),
        ),
      ),
    );
  }
}
