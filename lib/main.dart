import 'package:about/about_page.dart';
import 'package:core/core.dart';
import 'package:ditonton/presentation/pages/watchlist_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/movies.dart';
import 'package:tv_series/tv_series.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        colorScheme: kColorScheme,
        primaryColor: richBlack,
        scaffoldBackgroundColor: richBlack,
        textTheme: textTheme,
        drawerTheme: kDrawerTheme,
      ),
      initialRoute: homeMovieRoute,
      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case homeMovieRoute:
            return MaterialPageRoute(
              builder: (_) => const HomeMoviePage(),
              settings: settings,
            );
          case popularMoviesRoute:
            return CupertinoPageRoute(
              builder: (_) => const PopularMoviesPage(),
              settings: settings,
            );
          case topRatedMoviesRoute:
            return CupertinoPageRoute(
              builder: (_) => const TopRatedMoviesPage(),
              settings: settings,
            );
          case movieDetailRoute:
            final id = settings.arguments as int;
            return MaterialPageRoute(
              builder: (_) => MovieDetailPage(id: id),
              settings: settings,
            );
          case searchMovieRoute:
            return CupertinoPageRoute(
              builder: (_) => const SearchMoviePage(),
              settings: settings,
            );
          case watchlistRoute:
            return MaterialPageRoute(
              builder: (_) => const WatchlistPage(),
              settings: settings,
            );
          case AboutPage.routeName:
            return MaterialPageRoute(
              builder: (_) => const AboutPage(),
              settings: settings,
            );
          case homeTVSeriesRoute:
            return MaterialPageRoute(builder: (_) => const HomeTVSeriesPage());
          case popularTVSeriesRoute:
            return MaterialPageRoute(
              builder: (_) => const PopularTVSeriesPage(),
            );
          case topRatedTVSeriesRoute:
            return MaterialPageRoute(
              builder: (_) => const TopRatedTvSeriesPage(),
            );
          case tvSeriesDetailRoute:
            final id = settings.arguments as int;
            return MaterialPageRoute(
              builder: (_) => TVSeriesDetailPage(id: id),
            );
          case searchTVSeriesRoute:
            return MaterialPageRoute(
              builder: (_) => const SearchTVSeriesPage(),
            );
          default:
            return MaterialPageRoute(
              builder: (_) {
                return const Scaffold(
                  body: Center(child: Text('Page not found :(')),
                );
              },
            );
        }
      },
    );
  }
}
