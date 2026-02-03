import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tv_series/tv_series.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late MockWatchlistTVSeriesCubit mockCubit;

  setUp(() {
    mockCubit = MockWatchlistTVSeriesCubit();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<WatchlistTVSeriesCubit>.value(
      value: mockCubit,
      child: MaterialApp(home: Scaffold(body: body)),
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

  testWidgets('Page should display center progress bar when loading', (
    WidgetTester tester,
  ) async {
    when(mockCubit.state).thenReturn(const WatchlistTVSeriesState.loading());
    when(mockCubit.stream).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(makeTestableWidget(const WatchlistTVSeriesPage()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded', (
    WidgetTester tester,
  ) async {
    when(
      mockCubit.state,
    ).thenReturn(WatchlistTVSeriesState.loaded([tTVSeries]));
    when(mockCubit.stream).thenAnswer(
      (_) => Stream.value(WatchlistTVSeriesState.loaded([tTVSeries])),
    );

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        makeTestableWidget(const WatchlistTVSeriesPage()),
      );
    });

    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('TV Name'), findsOneWidget);
  });

  testWidgets('Page should display message when empty', (
    WidgetTester tester,
  ) async {
    when(mockCubit.state).thenReturn(const WatchlistTVSeriesState.empty());
    when(mockCubit.stream).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(makeTestableWidget(const WatchlistTVSeriesPage()));

    expect(find.text("You don't have watchlist yet"), findsOneWidget);
  });

  testWidgets('Page should display text message when error', (
    WidgetTester tester,
  ) async {
    when(
      mockCubit.state,
    ).thenReturn(const WatchlistTVSeriesState.error('Error Message'));
    when(mockCubit.stream).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(makeTestableWidget(const WatchlistTVSeriesPage()));

    expect(find.text('Error Message'), findsOneWidget);
  });
}
