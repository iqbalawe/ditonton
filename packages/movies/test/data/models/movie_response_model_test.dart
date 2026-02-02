import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/movies.dart';
import 'package:core/core.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/http_helper.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = null;
    PaintingBinding.instance.imageCache.clear();
    PaintingBinding.instance.imageCache.clearLiveImages();
  });

  final tMovie = Movie(
    adult: false,
    backdropPath: '/path.jpg',
    genreIds: const [1],
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

  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: Scaffold(body: body),
      routes: {
        movieDetailRoute: (context) =>
            const Scaffold(body: Text('Detail Page')),
      },
    );
  }

  testWidgets('should display movie information', (WidgetTester tester) async {
    await tester.pumpWidget(_makeTestableWidget(MovieCard(tMovie)));

    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Overview'), findsOneWidget);
    expect(find.byType(InkWell), findsOneWidget);
  });

  testWidgets('should navigate to detail page when tapped', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_makeTestableWidget(MovieCard(tMovie)));

    await tester.tap(find.byType(InkWell));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Detail Page'), findsOneWidget);
  });
}
