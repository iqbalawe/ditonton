import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import '../../domain/entities/tv_series.dart';
import '../../../../movies/lib/presentation/pages/home_movie_page.dart';
import 'popular_tv_series_page.dart';
import 'top_rated_tv_series_page.dart';
import 'tv_series_detail_page.dart';
import 'watchlist_tv_series_page.dart';
import '../bloc/tv_series_list_notifier.dart';
import 'package:core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTvSeriesPage extends StatefulWidget {
  static const routeName = '/home-tv-series';

  const HomeTvSeriesPage({super.key});

  @override
  State<HomeTvSeriesPage> createState() => _HomeTvSeriesPageState();
}

class _HomeTvSeriesPageState extends State<HomeTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Provider.of<TvSeriesListNotifier>(context, listen: false)
          ..fetchOnTheAirTvSeries()
          ..fetchTopRatedTvSeries()
          ..fetchPopularTvSeries();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
                backgroundColor: Colors.grey.shade900,
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
              decoration: BoxDecoration(color: Colors.grey.shade900),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Movies'),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  HomeMoviePage.routeName,
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.tv),
              title: Text('TV Series'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistTvSeriesPage.routeName);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, aboutRoute);
              },
              leading: Icon(Icons.info_outline),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, searchTVSeriesRoute);
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('On The Air', style: kHeading6),
              Consumer<TvSeriesListNotifier>(
                builder: (context, data, child) {
                  final state = data.onTheAirState;
                  if (state == RequestState.loading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state == RequestState.loaded) {
                    return TvSeriesList(data.onTheAirTvSeries);
                  } else {
                    return Text('Failed');
                  }
                },
              ),
              _buildSubHeading(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularTvSeriesPage.routeName),
              ),
              Consumer<TvSeriesListNotifier>(
                builder: (context, data, child) {
                  final state = data.popularTvSeriesState;
                  if (state == RequestState.loading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state == RequestState.loaded) {
                    return TvSeriesList(data.popularTvSeries);
                  } else {
                    return Text('Failed');
                  }
                },
              ),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () => Navigator.pushNamed(
                  context,
                  TopRatedTvSeriesPage.routeName,
                ),
              ),
              Consumer<TvSeriesListNotifier>(
                builder: (context, data, child) {
                  final state = data.topRatedTvSeriesState;
                  if (state == RequestState.loading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state == RequestState.loaded) {
                    return TvSeriesList(data.topRatedTvSeries);
                  } else {
                    return Text('Failed');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: kHeading6),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TvSeriesList extends StatelessWidget {
  final List<TvSeries> tvSeries;

  const TvSeriesList(this.tvSeries, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tv = tvSeries[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvSeriesDetailPage.routeName,
                  arguments: tv.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${tv.posterPath}',
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Container(
                    width: 100,
                    height: 150,
                    color: Colors.grey,
                    child: Icon(Icons.broken_image),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: tvSeries.length,
      ),
    );
  }
}
