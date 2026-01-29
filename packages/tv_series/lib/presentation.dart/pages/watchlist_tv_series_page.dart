import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

class WatchlistTVSeriesPage extends StatelessWidget {
  const WatchlistTVSeriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistTVSeriesCubit, WatchlistTVSeriesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (msg) => Center(child: Text(msg)),
          empty: () =>
              const Center(child: Text("You don't have watchlist yet")),
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
    );
  }
}
