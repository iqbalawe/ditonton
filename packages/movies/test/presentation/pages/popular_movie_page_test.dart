import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../helpers/http_helper.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockPopularCubit mockPopularCubit;

  setUpAll(() {
    HttpOverrides.global = MyHttpOverrides();
  });

  setUp(() {
    mockPopularCubit = MockPopularCubit();

    final di = GetIt.instance;
    if (di.isRegistered<PopularCubit>()) di.unregister<PopularCubit>();
    di.registerFactory<PopularCubit>(() => mockPopularCubit);
  });

  Widget makeTestableWidget(Widget body) {
    return MaterialApp(home: body);
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

  testWidgets('Page should display center progress bar when loading', (
    WidgetTester tester,
  ) async {
    when(
      mockPopularCubit.stream,
    ).thenAnswer((_) => Stream.value(const PopularState.loading()));
    when(mockPopularCubit.state).thenReturn(const PopularState.loading());
    when(mockPopularCubit.fetchPopularMovies()).thenAnswer((_) async {});
    when(mockPopularCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const PopularMoviesPage()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(Center), findsWidgets);
  });

  testWidgets('Page should display ListView when data is loaded', (
    WidgetTester tester,
  ) async {
    when(
      mockPopularCubit.stream,
    ).thenAnswer((_) => Stream.value(PopularState.loaded([tMovie])));
    when(mockPopularCubit.state).thenReturn(PopularState.loaded([tMovie]));
    when(mockPopularCubit.fetchPopularMovies()).thenAnswer((_) async {});
    when(mockPopularCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const PopularMoviesPage()));

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(MovieCard), findsOneWidget);
  });

  testWidgets('Page should display text with message when Error', (
    WidgetTester tester,
  ) async {
    when(mockPopularCubit.stream).thenAnswer(
      (_) => Stream.value(const PopularState.error('Error message')),
    );
    when(
      mockPopularCubit.state,
    ).thenReturn(const PopularState.error('Error message'));
    when(mockPopularCubit.fetchPopularMovies()).thenAnswer((_) async {});
    when(mockPopularCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const PopularMoviesPage()));

    expect(find.text('Error message'), findsOneWidget);
  });

  testWidgets('Page should display SizedBox when initial', (
    WidgetTester tester,
  ) async {
    when(
      mockPopularCubit.stream,
    ).thenAnswer((_) => Stream.value(const PopularState.initial()));
    when(mockPopularCubit.state).thenReturn(const PopularState.initial());
    when(mockPopularCubit.fetchPopularMovies()).thenAnswer((_) async {});
    when(mockPopularCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const PopularMoviesPage()));

    expect(find.byType(SizedBox), findsOneWidget);
  });
}
