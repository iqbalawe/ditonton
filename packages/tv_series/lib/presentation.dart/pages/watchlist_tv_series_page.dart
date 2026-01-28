import 'package:core/core.dart';
import 'package:flutter/material.dart';

class WatchlistTVSeriesPage extends StatefulWidget {
  static const routeName = '/watchlist-tv-series';

  const WatchlistTVSeriesPage({super.key});

  @override
  State<WatchlistTVSeriesPage> createState() => _WatchlistTVSeriesPageState();
}

class _WatchlistTVSeriesPageState extends State<WatchlistTVSeriesPage>
    with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Watchlist')),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox.shrink(),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
