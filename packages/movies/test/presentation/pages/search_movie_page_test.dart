import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../helpers/test_helper.mocks.dart';
import '../../helpers/http_helper.dart';

void main() {
  late MockSearchMoviesCubit mockSearchMoviesCubit;

  setUpAll(() {
    HttpOverrides.global = MyHttpOverrides();
  });

  setUp(() {
    mockSearchMoviesCubit = MockSearchMoviesCubit();
    final di = GetIt.instance;
    if (di.isRegistered<SearchMoviesCubit>())
      di.unregister<SearchMoviesCubit>();
    di.registerFactory<SearchMoviesCubit>(() => mockSearchMoviesCubit);
  });

  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(home: body);
  }

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

  testWidgets('Page should display default text when initial', (
    WidgetTester tester,
  ) async {
    when(
      mockSearchMoviesCubit.stream,
    ).thenAnswer((_) => Stream.value(const SearchMoviesState.initial()));
    when(
      mockSearchMoviesCubit.state,
    ).thenReturn(const SearchMoviesState.initial());
    when(mockSearchMoviesCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(_makeTestableWidget(const SearchMoviePage()));

    expect(find.text('Start searching...'), findsOneWidget);
  });

  testWidgets('Page should trigger search when user types', (
    WidgetTester tester,
  ) async {
    when(
      mockSearchMoviesCubit.stream,
    ).thenAnswer((_) => Stream.value(const SearchMoviesState.initial()));
    when(
      mockSearchMoviesCubit.state,
    ).thenReturn(const SearchMoviesState.initial());
    when(mockSearchMoviesCubit.onQueryChanged(any)).thenAnswer((_) async {});
    when(mockSearchMoviesCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(_makeTestableWidget(const SearchMoviePage()));

    await tester.enterText(find.byType(TextField), 'spiderman');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pump();

    verify(mockSearchMoviesCubit.onQueryChanged('spiderman'));
  });

  testWidgets('Page should display loading indicator when loading', (
    WidgetTester tester,
  ) async {
    when(
      mockSearchMoviesCubit.stream,
    ).thenAnswer((_) => Stream.value(const SearchMoviesState.loading()));
    when(
      mockSearchMoviesCubit.state,
    ).thenReturn(const SearchMoviesState.loading());
    when(mockSearchMoviesCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(_makeTestableWidget(const SearchMoviePage()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Page should display error message when error', (
    WidgetTester tester,
  ) async {
    when(
      mockSearchMoviesCubit.stream,
    ).thenAnswer((_) => Stream.value(const SearchMoviesState.error('Error')));
    when(
      mockSearchMoviesCubit.state,
    ).thenReturn(const SearchMoviesState.error('Error'));
    when(mockSearchMoviesCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(_makeTestableWidget(const SearchMoviePage()));

    expect(find.text('Error'), findsOneWidget);
  });

  testWidgets('Page should display empty text when empty', (
    WidgetTester tester,
  ) async {
    when(
      mockSearchMoviesCubit.stream,
    ).thenAnswer((_) => Stream.value(const SearchMoviesState.empty()));
    when(
      mockSearchMoviesCubit.state,
    ).thenReturn(const SearchMoviesState.empty());
    when(mockSearchMoviesCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(_makeTestableWidget(const SearchMoviePage()));

    expect(find.text('Movie not found'), findsOneWidget);
  });

  testWidgets('Page should display list when loaded', (
    WidgetTester tester,
  ) async {
    when(
      mockSearchMoviesCubit.stream,
    ).thenAnswer((_) => Stream.value(SearchMoviesState.loaded([tMovie])));
    when(
      mockSearchMoviesCubit.state,
    ).thenReturn(SearchMoviesState.loaded([tMovie]));
    when(mockSearchMoviesCubit.close()).thenAnswer((_) async {});

    await tester.pumpWidget(_makeTestableWidget(const SearchMoviePage()));

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(MovieCard), findsOneWidget);
  });
}
