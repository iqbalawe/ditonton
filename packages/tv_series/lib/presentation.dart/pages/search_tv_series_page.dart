import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_series/tv_series.dart';

class SearchTVSeriesPage extends StatelessWidget {
  const SearchTVSeriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<SearchTVSeriesCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Search')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onSubmitted: (query) {
                  context.read<SearchTVSeriesCubit>().onQueryChanged(query);
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
                child: BlocBuilder<SearchTVSeriesCubit, SearchTVSeriesState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox(),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (msg) => Center(child: Text(msg)),
                      empty: () =>
                          const Center(child: Text('TV Series not found')),
                      loaded: (tvSeries) {
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            final tv = tvSeries[index];
                            return TvSeriesCard(tv);
                          },
                          itemCount: tvSeries.length,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
