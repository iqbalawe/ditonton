import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/movies.dart';
import 'package:core/core.dart';

class TestNavigatorObserver extends NavigatorObserver {
  Route<dynamic>? pushedRoute;
  Object? pushedArguments;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    pushedRoute = route;
    pushedArguments = route.settings.arguments;
    super.didPush(route, previousRoute);
  }
}

void main() {
  late TestNavigatorObserver observer;

  setUpAll(() {
    HttpOverrides.global = null;
  });

  setUp(() {
    observer = TestNavigatorObserver();
  });

  final tMovie = const Movie(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );
  final tMovies = [tMovie];

  Widget makeTestableWidget(Widget body) {
    return MaterialApp(
      home: Scaffold(body: body),
      navigatorObservers: [observer],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Text('Detail Page')),
          settings: settings,
        );
      },
    );
  }

  testWidgets('MovieList should display items and navigate on tap', (
    tester,
  ) async {
    await tester.pumpWidget(makeTestableWidget(MovieList(tMovies)));
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(InkWell), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();
    expect(observer.pushedRoute?.settings.name, movieDetailRoute);
    expect(observer.pushedArguments, tMovie.id);
  });
}
