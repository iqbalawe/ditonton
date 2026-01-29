import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/movies.dart';

class SearchMoviePage extends StatelessWidget {
  const SearchMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance<SearchMoviesCubit>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('Search')),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    onSubmitted: (query) {
                      context.read<SearchMoviesCubit>().onQueryChanged(query);
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search title',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.search,
                  ),
                  const SizedBox(height: 16),
                  Text('Search Result', style: heading6),
                  Expanded(
                    child: BlocBuilder<SearchMoviesCubit, SearchMoviesState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () =>
                              const Center(child: Text('Start searching...')),
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (msg) => Center(child: Text(msg)),
                          empty: () =>
                              const Center(child: Text('Movie not found')),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
