import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/movies.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = null;
    PaintingBinding.instance.imageCache.clear();
    PaintingBinding.instance.imageCache.clearLiveImages();
  });

  final tMovie = const Movie(
    adult: false,
    backdropPath: '/path.jpg',
    genreIds: [1],
    id: 1,
    originalTitle: 'Title',
    overview: 'Overview',
    popularity: 1.0,
    posterPath: '/poster.jpg',
    releaseDate: '2024-01-01',
    title: 'Title',
    video: false,
    voteAverage: 1.0,
    voteCount: 1,
  );

  Widget makeTestableWidget(Widget body) {
    return MaterialApp(
      home: Scaffold(body: body),
      routes: {
        movieDetailRoute: (context) =>
            const Scaffold(body: Text('Detail Page')),
      },
    );
  }

  testWidgets('should display movie information', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(MovieCard(tMovie)));

    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Overview'), findsOneWidget);
    expect(find.byType(InkWell), findsOneWidget);
  });

  testWidgets('should navigate to detail page when tapped', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(makeTestableWidget(MovieCard(tMovie)));

    await tester.tap(find.byType(InkWell));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Detail Page'), findsOneWidget);
  });
}
