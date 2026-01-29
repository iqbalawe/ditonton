import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_series/tv_series.dart';

class PopularTVSeriesPage extends StatefulWidget {
  const PopularTVSeriesPage({super.key});

  @override
  State<PopularTVSeriesPage> createState() => _PopularTVSeriesPageState();
}

class _PopularTVSeriesPageState extends State<PopularTVSeriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popular TV Series')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (_) =>
              GetIt.instance<PopularTVSeriesCubit>()..fetchPopularTVSeries(),
          child: BlocBuilder<PopularTVSeriesCubit, PopularTVSeriesState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox(),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (msg) => Center(child: Text(msg)),
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
      ),
    );
  }
}
