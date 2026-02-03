import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../helpers/http_helper.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockWatchlistMoviesCubit mockWatchlistMoviesCubit;

  setUpAll(() {
    HttpOverrides.global = MyHttpOverrides();
  });

  setUp(() {
    mockWatchlistMoviesCubit = MockWatchlistMoviesCubit();
  });

  Widget makeTestableWidget(Widget body) {
    return MaterialApp(
      home: BlocProvider<WatchlistMoviesCubit>(
        create: (context) => mockWatchlistMoviesCubit,
        // PERBAIKAN DISINI: Bungkus body dengan Scaffold
        child: Scaffold(body: body),
      ),
    );
  }

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

  testWidgets('Page should display loading indicator', (
    WidgetTester tester,
  ) async {
    when(
      mockWatchlistMoviesCubit.stream,
    ).thenAnswer((_) => Stream.value(const WatchlistMoviesState.loading()));
    when(
      mockWatchlistMoviesCubit.state,
    ).thenReturn(const WatchlistMoviesState.loading());
    when(mockWatchlistMoviesCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const WatchlistMoviesPage()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Page should display empty text when empty', (
    WidgetTester tester,
  ) async {
    when(
      mockWatchlistMoviesCubit.stream,
    ).thenAnswer((_) => Stream.value(const WatchlistMoviesState.empty()));
    when(
      mockWatchlistMoviesCubit.state,
    ).thenReturn(const WatchlistMoviesState.empty());
    when(mockWatchlistMoviesCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const WatchlistMoviesPage()));

    expect(find.text("You don't have watchlist yet"), findsOneWidget);
  });

  testWidgets('Page should display error message', (WidgetTester tester) async {
    when(mockWatchlistMoviesCubit.stream).thenAnswer(
      (_) => Stream.value(const WatchlistMoviesState.error("Failed")),
    );
    when(
      mockWatchlistMoviesCubit.state,
    ).thenReturn(const WatchlistMoviesState.error("Failed"));
    when(mockWatchlistMoviesCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const WatchlistMoviesPage()));

    expect(find.text('Failed'), findsOneWidget);
  });

  testWidgets('Page should display list when loaded', (
    WidgetTester tester,
  ) async {
    when(
      mockWatchlistMoviesCubit.stream,
    ).thenAnswer((_) => Stream.value(WatchlistMoviesState.loaded([tMovie])));
    when(
      mockWatchlistMoviesCubit.state,
    ).thenReturn(WatchlistMoviesState.loaded([tMovie]));
    when(mockWatchlistMoviesCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const WatchlistMoviesPage()));

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(MovieCard), findsOneWidget);
  });

  testWidgets('Page should display SizedBox when initial', (
    WidgetTester tester,
  ) async {
    when(
      mockWatchlistMoviesCubit.stream,
    ).thenAnswer((_) => Stream.value(const WatchlistMoviesState.initial()));
    when(
      mockWatchlistMoviesCubit.state,
    ).thenReturn(const WatchlistMoviesState.initial());
    when(mockWatchlistMoviesCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const WatchlistMoviesPage()));

    expect(find.byType(SizedBox), findsOneWidget);
  });
}
