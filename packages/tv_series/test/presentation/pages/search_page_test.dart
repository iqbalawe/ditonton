import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late MockSearchTVSeriesCubit mockCubit;

  setUp(() {
    mockCubit = MockSearchTVSeriesCubit();
    GetIt.I.registerFactory<SearchTVSeriesCubit>(() => mockCubit);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<SearchTVSeriesCubit>.value(
      value: mockCubit,
      child: MaterialApp(home: body),
    );
  }

  final tTVSeries = const TVSeries(
    adult: false,
    backdropPath: '/path.jpg',
    genreIds: [1, 2],
    id: 1,
    originalName: 'Original',
    overview: 'Overview',
    popularity: 1.0,
    posterPath: '/poster.jpg',
    firstAirDate: '2022',
    name: 'TV Name',
    voteAverage: 8.0,
    voteCount: 100,
  );

  testWidgets('Page should display TextField and Initial state', (
    WidgetTester tester,
  ) async {
    when(mockCubit.state).thenReturn(const SearchTVSeriesState.initial());
    when(mockCubit.stream).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(makeTestableWidget(const SearchTVSeriesPage()));

    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('Page should trigger search when text submitted', (
    WidgetTester tester,
  ) async {
    when(mockCubit.state).thenReturn(const SearchTVSeriesState.initial());
    when(mockCubit.stream).thenAnswer((_) => const Stream.empty());
    when(mockCubit.onQueryChanged(any)).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const SearchTVSeriesPage()));
    await tester.enterText(find.byType(TextField), 'spiderman');
    await tester.testTextInput.receiveAction(TextInputAction.search);

    verify(mockCubit.onQueryChanged('spiderman')).called(1);
  });

  testWidgets('Page should display loading indicator when loading', (
    WidgetTester tester,
  ) async {
    when(mockCubit.state).thenReturn(const SearchTVSeriesState.loading());
    when(mockCubit.stream).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(makeTestableWidget(const SearchTVSeriesPage()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded', (
    WidgetTester tester,
  ) async {
    when(mockCubit.state).thenReturn(SearchTVSeriesState.loaded([tTVSeries]));
    when(
      mockCubit.stream,
    ).thenAnswer((_) => Stream.value(SearchTVSeriesState.loaded([tTVSeries])));

    await tester.pumpWidget(makeTestableWidget(const SearchTVSeriesPage()));
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('Page should display message when empty', (
    WidgetTester tester,
  ) async {
    when(mockCubit.state).thenReturn(const SearchTVSeriesState.empty());
    when(mockCubit.stream).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(makeTestableWidget(const SearchTVSeriesPage()));

    expect(find.text('TV Series not found'), findsOneWidget);
  });

  testWidgets('Page should display error message when error', (
    WidgetTester tester,
  ) async {
    when(
      mockCubit.state,
    ).thenReturn(const SearchTVSeriesState.error('Error Message'));
    when(mockCubit.stream).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(makeTestableWidget(const SearchTVSeriesPage()));

    expect(find.text('Error Message'), findsOneWidget);
  });
}
