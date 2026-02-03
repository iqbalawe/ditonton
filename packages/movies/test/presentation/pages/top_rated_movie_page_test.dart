import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../helpers/http_helper.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockTopRatedCubit mockTopRatedCubit;

  setUpAll(() {
    HttpOverrides.global = MyHttpOverrides();
  });

  setUp(() {
    mockTopRatedCubit = MockTopRatedCubit();
    final di = GetIt.instance;
    if (di.isRegistered<TopRatedCubit>()) di.unregister<TopRatedCubit>();
    di.registerFactory<TopRatedCubit>(() => mockTopRatedCubit);
  });

  Widget makeTestableWidget(Widget body) {
    return MaterialApp(home: body);
  }

  testWidgets('Page should display progress bar when loading', (
    WidgetTester tester,
  ) async {
    when(
      mockTopRatedCubit.stream,
    ).thenAnswer((_) => Stream.value(const TopRatedState.loading()));
    when(mockTopRatedCubit.state).thenReturn(const TopRatedState.loading());
    when(mockTopRatedCubit.fetchTopRatedMovies()).thenAnswer((_) async {});
    when(mockTopRatedCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const TopRatedMoviesPage()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Page should display when data is loaded', (
    WidgetTester tester,
  ) async {
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

    when(
      mockTopRatedCubit.stream,
    ).thenAnswer((_) => Stream.value(TopRatedState.loaded([tMovie])));
    when(mockTopRatedCubit.state).thenReturn(TopRatedState.loaded([tMovie]));
    when(mockTopRatedCubit.fetchTopRatedMovies()).thenAnswer((_) async {});
    when(mockTopRatedCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const TopRatedMoviesPage()));

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(MovieCard), findsOneWidget);
  });

  testWidgets('Page should display text with message when Error', (
    WidgetTester tester,
  ) async {
    when(mockTopRatedCubit.stream).thenAnswer(
      (_) => Stream.value(const TopRatedState.error('Error message')),
    );
    when(
      mockTopRatedCubit.state,
    ).thenReturn(const TopRatedState.error('Error message'));
    when(mockTopRatedCubit.fetchTopRatedMovies()).thenAnswer((_) async {});
    when(mockTopRatedCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const TopRatedMoviesPage()));

    expect(find.text('Error message'), findsOneWidget);
  });

  testWidgets('Page should display SizedBox when initial', (
    WidgetTester tester,
  ) async {
    when(
      mockTopRatedCubit.stream,
    ).thenAnswer((_) => Stream.value(const TopRatedState.initial()));
    when(mockTopRatedCubit.state).thenReturn(const TopRatedState.initial());
    when(mockTopRatedCubit.fetchTopRatedMovies()).thenAnswer((_) async {});
    when(mockTopRatedCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const TopRatedMoviesPage()));

    expect(find.byType(SizedBox), findsOneWidget);
  });
}
