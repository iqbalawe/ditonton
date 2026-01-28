import 'package:core/core.dart';
import 'package:flutter/material.dart';

class HomeTVSeriesPage extends StatefulWidget {
  const HomeTVSeriesPage({super.key});

  @override
  State<HomeTVSeriesPage> createState() => _HomeTVSeriesPageState();
}

class _HomeTVSeriesPageState extends State<HomeTVSeriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const TmdbDrawer(),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('On The Air', style: heading6),
              SubHeading(
                title: 'Popular',
                onTap: () => Navigator.pushNamed(context, popularTVSeriesRoute),
              ),
              SubHeading(
                title: 'Top Rated',
                onTap: () => Navigator.pushNamed(context, topRatedMoviesRoute),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
