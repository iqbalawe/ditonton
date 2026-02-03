import 'dart:async';
import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../helpers/http_helper.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockMovieDetailCubit mockMovieDetailCubit;
  late MockRecommendationsCubit mockRecommendationsCubit;
  late MockWatchlistStatusCubit mockWatchlistStatusCubit;

  setUpAll(() {
    HttpOverrides.global = MyHttpOverrides();
  });

  setUp(() {
    mockMovieDetailCubit = MockMovieDetailCubit();
    mockRecommendationsCubit = MockRecommendationsCubit();
    mockWatchlistStatusCubit = MockWatchlistStatusCubit();

    final di = GetIt.instance;
    if (di.isRegistered<MovieDetailCubit>()) di.unregister<MovieDetailCubit>();
    if (di.isRegistered<RecommendationsCubit>()) {
      di.unregister<RecommendationsCubit>();
    }
    if (di.isRegistered<WatchlistStatusCubit>()) {
      di.unregister<WatchlistStatusCubit>();
    }

    di.registerFactory<MovieDetailCubit>(() => mockMovieDetailCubit);
    di.registerFactory<RecommendationsCubit>(() => mockRecommendationsCubit);
    di.registerFactory<WatchlistStatusCubit>(() => mockWatchlistStatusCubit);
  });

  void stubCubit({
    required MovieDetailState detailState,
    required RecommendationsState recommendState,
    required WatchlistStatusState watchlistState,
  }) {
    when(
      mockMovieDetailCubit.stream,
    ).thenAnswer((_) => Stream.value(detailState));
    when(mockMovieDetailCubit.state).thenReturn(detailState);
    when(mockMovieDetailCubit.fetchMovieDetail(any)).thenAnswer((_) async {});
    when(mockMovieDetailCubit.close()).thenAnswer((_) async {});

    when(
      mockRecommendationsCubit.stream,
    ).thenAnswer((_) => Stream.value(recommendState));
    when(mockRecommendationsCubit.state).thenReturn(recommendState);
    when(
      mockRecommendationsCubit.fetchMovieRecommendations(any),
    ).thenAnswer((_) async {});
    when(mockRecommendationsCubit.close()).thenAnswer((_) async {});

    when(
      mockWatchlistStatusCubit.stream,
    ).thenAnswer((_) => Stream.value(watchlistState));
    when(mockWatchlistStatusCubit.state).thenReturn(watchlistState);
    when(
      mockWatchlistStatusCubit.loadWatchlistStatus(any),
    ).thenAnswer((_) async {});
    when(mockWatchlistStatusCubit.close()).thenAnswer((_) async {});
  }

  Widget createTestableWidget(Widget body) {
    return MaterialApp(
      home: body,
      routes: {
        movieDetailRoute: (_) =>
            Scaffold(appBar: AppBar(), body: const Text('New Detail Page')),
      },
    );
  }

  const tId = 1;
  final tMovieDetail = const MovieDetail(
    adult: false,
    backdropPath: 'backdropPath',
    genres: [Genre(id: 1, name: 'Action')],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    runtime: 120,
    title: 'title',
    voteAverage: 1,
    voteCount: 1,
  );

  final tMovie = const Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1],
    id: 2,
    originalTitle: 'Recommendation',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'Recommendation',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  group('MovieDetailPage', () {
    testWidgets(
      'should display loading indicator when movie detail is loading',
      (WidgetTester tester) async {
        stubCubit(
          detailState: const MovieDetailState.loading(),
          recommendState: const RecommendationsState.loading(),
          watchlistState: const WatchlistStatusState.initial(),
        );

        await tester.pumpWidget(
          createTestableWidget(const MovieDetailPage(id: tId)),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets('should display error message when movie detail error', (
      WidgetTester tester,
    ) async {
      stubCubit(
        detailState: const MovieDetailState.error('Error'),
        recommendState: const RecommendationsState.initial(),
        watchlistState: const WatchlistStatusState.initial(),
      );

      await tester.pumpWidget(
        createTestableWidget(const MovieDetailPage(id: tId)),
      );

      expect(find.text('Error'), findsOneWidget);
    });

    testWidgets(
      'should display movie detail, recommendations, and handle add watchlist',
      (WidgetTester tester) async {
        stubCubit(
          detailState: MovieDetailState.loaded(tMovieDetail),
          recommendState: RecommendationsState.loaded([tMovie]),
          watchlistState: const WatchlistStatusState.isAdded(false),
        );

        when(
          mockWatchlistStatusCubit.addWatchlist(tMovieDetail),
        ).thenAnswer((_) async {});

        await tester.pumpWidget(
          createTestableWidget(const MovieDetailPage(id: tId)),
        );
        await tester.pump();

        expect(find.text('title'), findsOneWidget);
        expect(find.text('overview'), findsOneWidget);
        expect(find.byIcon(Icons.add), findsOneWidget);

        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();

        verify(mockWatchlistStatusCubit.addWatchlist(tMovieDetail));
      },
    );

    testWidgets('should handle remove watchlist interaction', (
      WidgetTester tester,
    ) async {
      stubCubit(
        detailState: MovieDetailState.loaded(tMovieDetail),
        recommendState: const RecommendationsState.loaded([]),
        watchlistState: const WatchlistStatusState.isAdded(true),
      );

      when(
        mockWatchlistStatusCubit.removeFromWatchlist(tMovieDetail),
      ).thenAnswer((_) async {});

      await tester.pumpWidget(
        createTestableWidget(const MovieDetailPage(id: tId)),
      );
      await tester.pump();

      expect(find.byIcon(Icons.check), findsOneWidget);

      await tester.tap(find.byIcon(Icons.check));
      await tester.pump();

      verify(mockWatchlistStatusCubit.removeFromWatchlist(tMovieDetail));
    });

    testWidgets('should display Snackbar when watchlist message received', (
      WidgetTester tester,
    ) async {
      when(
        mockMovieDetailCubit.stream,
      ).thenAnswer((_) => Stream.value(MovieDetailState.loaded(tMovieDetail)));
      when(
        mockMovieDetailCubit.state,
      ).thenReturn(MovieDetailState.loaded(tMovieDetail));
      when(mockMovieDetailCubit.fetchMovieDetail(any)).thenAnswer((_) async {});
      when(mockMovieDetailCubit.close()).thenAnswer((_) async {});

      when(
        mockRecommendationsCubit.stream,
      ).thenAnswer((_) => Stream.value(const RecommendationsState.loaded([])));
      when(
        mockRecommendationsCubit.state,
      ).thenReturn(const RecommendationsState.loaded([]));
      when(
        mockRecommendationsCubit.fetchMovieRecommendations(any),
      ).thenAnswer((_) async {});
      when(mockRecommendationsCubit.close()).thenAnswer((_) async {});

      when(mockWatchlistStatusCubit.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const WatchlistStatusState.isAdded(false),
          const WatchlistStatusState.message('Added to Watchlist'),
        ]),
      );
      when(
        mockWatchlistStatusCubit.state,
      ).thenReturn(const WatchlistStatusState.isAdded(false));
      when(
        mockWatchlistStatusCubit.loadWatchlistStatus(any),
      ).thenAnswer((_) async {});
      when(mockWatchlistStatusCubit.close()).thenAnswer((_) async {});

      await tester.pumpWidget(
        createTestableWidget(const MovieDetailPage(id: tId)),
      );
      await tester.pump();
      await tester.pump();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Added to Watchlist'), findsOneWidget);
    });

    testWidgets('should handle recommendation error and empty state', (
      tester,
    ) async {
      stubCubit(
        detailState: MovieDetailState.loaded(tMovieDetail),
        recommendState: const RecommendationsState.error('Error Rec'),
        watchlistState: const WatchlistStatusState.isAdded(false),
      );

      await tester.pumpWidget(
        createTestableWidget(const MovieDetailPage(id: tId)),
      );
      await tester.pump();

      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('should display text when recommendations empty', (
      tester,
    ) async {
      stubCubit(
        detailState: MovieDetailState.loaded(tMovieDetail),
        recommendState: const RecommendationsState.empty(),
        watchlistState: const WatchlistStatusState.isAdded(false),
      );

      await tester.pumpWidget(
        createTestableWidget(const MovieDetailPage(id: tId)),
      );
      await tester.pump();

      expect(find.text('No Recommendations'), findsOneWidget);
    });

    testWidgets(
      'should navigate to new detail page when recommendation tapped',
      (tester) async {
        stubCubit(
          detailState: MovieDetailState.loaded(tMovieDetail),
          recommendState: RecommendationsState.loaded([tMovie]),
          watchlistState: const WatchlistStatusState.isAdded(false),
        );

        await tester.pumpWidget(
          createTestableWidget(const MovieDetailPage(id: tId)),
        );
        await tester.pump();

        final mainScrollable = find.byType(Scrollable).first;

        final recommendationCard = find
            .descendant(
              of: find.byType(ListView),
              matching: find.byType(InkWell),
            )
            .first;

        await tester.scrollUntilVisible(
          recommendationCard,
          500,
          scrollable: mainScrollable,
        );

        await tester.tap(recommendationCard);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 800));

        expect(find.text('New Detail Page'), findsOneWidget);
      },
    );
  });
}
