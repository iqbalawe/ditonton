import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tv_series/tv_series.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late MockTopRatedTVSeriesCubit mockCubit;

  setUp(() {
    mockCubit = MockTopRatedTVSeriesCubit();
    GetIt.I.registerFactory<TopRatedTVSeriesCubit>(() => mockCubit);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  Widget makeTestableWidget(Widget body) {
    return MaterialApp(home: body);
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
    when(mockCubit.state).thenReturn(const TopRatedTVSeriesState.loading());
    when(mockCubit.stream).thenAnswer((_) => const Stream.empty());
    when(mockCubit.fetchTopRatedTVSeries()).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const TopRatedTvSeriesPage()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded', (
    WidgetTester tester,
  ) async {
    when(mockCubit.state).thenReturn(TopRatedTVSeriesState.loaded([tTVSeries]));
    when(mockCubit.stream).thenAnswer(
      (_) => Stream.value(TopRatedTVSeriesState.loaded([tTVSeries])),
    );
    when(mockCubit.fetchTopRatedTVSeries()).thenAnswer((_) async {});

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(makeTestableWidget(const TopRatedTvSeriesPage()));
    });

    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('TV Name'), findsOneWidget);
  });

  testWidgets('Page should display text message when error', (
    WidgetTester tester,
  ) async {
    when(
      mockCubit.state,
    ).thenReturn(const TopRatedTVSeriesState.error('Error Message'));
    when(mockCubit.stream).thenAnswer((_) => const Stream.empty());
    when(mockCubit.fetchTopRatedTVSeries()).thenAnswer((_) async {});

    await tester.pumpWidget(makeTestableWidget(const TopRatedTvSeriesPage()));

    expect(find.text('Error Message'), findsOneWidget);
  });
}
