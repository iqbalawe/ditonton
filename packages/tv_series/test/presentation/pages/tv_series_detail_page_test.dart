import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tv_series/tv_series.dart';
import 'package:core/core.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late MockTVSeriesDetailCubit mockDetailCubit;
  late MockTVSeriesRecommendationsCubit mockRecommendationCubit;
  late MockWatchlistTVSeriesStatusCubit mockStatusCubit;

  setUp(() {
    mockDetailCubit = MockTVSeriesDetailCubit();
    mockRecommendationCubit = MockTVSeriesRecommendationsCubit();
    mockStatusCubit = MockWatchlistTVSeriesStatusCubit();

    GetIt.I.registerFactory<TVSeriesDetailCubit>(() => mockDetailCubit);
    GetIt.I.registerFactory<TVSeriesRecommendationsCubit>(
      () => mockRecommendationCubit,
    );
    GetIt.I.registerFactory<WatchlistTVSeriesStatusCubit>(
      () => mockStatusCubit,
    );
  });

  tearDown(() {
    GetIt.I.reset();
  });

  Widget makeTestableWidget(Widget body) {
    return MaterialApp(home: body);
  }

  const tId = 1;
  final tDetail = const TVSeriesDetail(
    adult: false,
    backdropPath: '/path.jpg',
    genres: [Genre(id: 1, name: 'Action')],
    id: 1,
    name: 'Detail TV',
    numberOfEpisodes: 10,
    numberOfSeasons: 1,
    originalLanguage: 'en',
    originalName: 'Original',
    overview: 'Overview Detail',
    posterPath: '/poster.jpg',
    voteAverage: 8.5,
    voteCount: 100,
    seasons: [
      Season(
        airDate: '2022',
        episodeCount: 10,
        id: 1,
        name: 'Season 1',
        overview: '',
        posterPath: '/s1.jpg',
        seasonNumber: 1,
      ),
    ],
  );

  testWidgets('Page should display loading indicator when loading', (
    WidgetTester tester,
  ) async {
    when(mockDetailCubit.state).thenReturn(const TVSeriesDetailState.loading());
    when(mockDetailCubit.stream).thenAnswer((_) => const Stream.empty());
    when(mockDetailCubit.fetchTVSeriesDetail(tId)).thenAnswer((_) async {});

    when(
      mockRecommendationCubit.fetchTVSeriesRecommendations(tId),
    ).thenAnswer((_) async {});
    when(mockStatusCubit.loadWatchlistStatus(tId)).thenAnswer((_) async {});

    await tester.pumpWidget(
      makeTestableWidget(const TVSeriesDetailPage(id: tId)),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Page should display error message when error', (
    WidgetTester tester,
  ) async {
    when(
      mockDetailCubit.state,
    ).thenReturn(const TVSeriesDetailState.error('Error Message'));
    when(mockDetailCubit.stream).thenAnswer((_) => const Stream.empty());
    when(mockDetailCubit.fetchTVSeriesDetail(tId)).thenAnswer((_) async {});

    when(
      mockRecommendationCubit.fetchTVSeriesRecommendations(tId),
    ).thenAnswer((_) async {});
    when(mockStatusCubit.loadWatchlistStatus(tId)).thenAnswer((_) async {});

    await tester.pumpWidget(
      makeTestableWidget(const TVSeriesDetailPage(id: tId)),
    );

    expect(find.text('Error Message'), findsOneWidget);
  });

  testWidgets(
    'Page should display detail content, seasons, and watchlist button when loaded',
    (WidgetTester tester) async {
      when(
        mockDetailCubit.state,
      ).thenReturn(TVSeriesDetailState.loaded(tDetail));
      when(
        mockDetailCubit.stream,
      ).thenAnswer((_) => Stream.value(TVSeriesDetailState.loaded(tDetail)));
      when(mockDetailCubit.fetchTVSeriesDetail(tId)).thenAnswer((_) async {});

      when(
        mockRecommendationCubit.state,
      ).thenReturn(const TVSeriesRecommendationsState.loaded([]));
      when(mockRecommendationCubit.stream).thenAnswer(
        (_) => Stream.value(const TVSeriesRecommendationsState.loaded([])),
      );
      when(
        mockRecommendationCubit.fetchTVSeriesRecommendations(tId),
      ).thenAnswer((_) async {});

      when(
        mockStatusCubit.state,
      ).thenReturn(const WatchlistTVSeriesStatusState.isAdded(false));
      when(mockStatusCubit.stream).thenAnswer(
        (_) => Stream.value(const WatchlistTVSeriesStatusState.isAdded(false)),
      );
      when(mockStatusCubit.loadWatchlistStatus(tId)).thenAnswer((_) async {});

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          makeTestableWidget(const TVSeriesDetailPage(id: tId)),
        );
      });

      expect(find.text('Detail TV'), findsOneWidget);
      expect(find.text('Overview Detail'), findsOneWidget);
      expect(find.text('Seasons'), findsOneWidget);
      expect(find.text('Season 1'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    },
  );

  testWidgets('Watchlist button should trigger add/remove and show snackbar', (
    WidgetTester tester,
  ) async {
    when(mockDetailCubit.state).thenReturn(TVSeriesDetailState.loaded(tDetail));
    when(
      mockDetailCubit.stream,
    ).thenAnswer((_) => Stream.value(TVSeriesDetailState.loaded(tDetail)));
    when(mockDetailCubit.fetchTVSeriesDetail(tId)).thenAnswer((_) async {});

    when(
      mockRecommendationCubit.state,
    ).thenReturn(const TVSeriesRecommendationsState.loaded([]));
    when(mockRecommendationCubit.stream).thenAnswer(
      (_) => Stream.value(const TVSeriesRecommendationsState.loaded([])),
    );
    when(
      mockRecommendationCubit.fetchTVSeriesRecommendations(tId),
    ).thenAnswer((_) async {});

    when(
      mockStatusCubit.state,
    ).thenReturn(const WatchlistTVSeriesStatusState.isAdded(false));
    when(mockStatusCubit.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const WatchlistTVSeriesStatusState.isAdded(false),
        const WatchlistTVSeriesStatusState.message('Added to Watchlist'),
        const WatchlistTVSeriesStatusState.isAdded(true),
      ]),
    );

    when(mockStatusCubit.loadWatchlistStatus(tId)).thenAnswer((_) async {});
    when(mockStatusCubit.addWatchlist(tDetail)).thenAnswer((_) async {});

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        makeTestableWidget(const TVSeriesDetailPage(id: tId)),
      );
    });

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    verify(mockStatusCubit.addWatchlist(tDetail)).called(1);

    expect(find.text('Added to Watchlist'), findsOneWidget);
  });
}
