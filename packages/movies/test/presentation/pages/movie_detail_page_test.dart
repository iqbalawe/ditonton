import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../helpers/cubit_test_helper.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockMovieDetailCubit mockDetailCubit;
  late MockRecommendationsCubit mockRecommendationsCubit;
  late MockWatchlistStatusCubit mockWatchlistCubit;

  setUp(() {
    mockDetailCubit = MockMovieDetailCubit();
    mockRecommendationsCubit = MockRecommendationsCubit();
    mockWatchlistCubit = MockWatchlistStatusCubit();

    GetIt.I.registerSingleton<MovieDetailCubit>(mockDetailCubit);
    GetIt.I.registerSingleton<RecommendationsCubit>(mockRecommendationsCubit);
    GetIt.I.registerSingleton<WatchlistStatusCubit>(mockWatchlistCubit);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(home: body);
  }

  final tId = 1;
  final tMovieDetail = MovieDetail(
    adult: false,
    backdropPath: 'path',
    genres: [Genre(id: 1, name: 'Action')],
    id: 1,
    originalTitle: 'title',
    overview: 'overview',
    posterPath: 'path',
    releaseDate: 'date',
    runtime: 120,
    title: 'title',
    voteAverage: 1,
    voteCount: 1,
  );

  testWidgets('Watchlist button should display add icon when movie not added', (
    tester,
  ) async {
    mockCubitStream(mockDetailCubit, MovieDetailState.loaded(tMovieDetail));
    mockCubitStream(
      mockRecommendationsCubit,
      const RecommendationsState.loaded([]),
    );
    mockCubitStream(
      mockWatchlistCubit,
      const WatchlistStatusState.isAdded(false),
    );

    when(mockDetailCubit.fetchMovieDetail(tId)).thenAnswer((_) async {});
    when(
      mockRecommendationsCubit.fetchMovieRecommendations(tId),
    ).thenAnswer((_) async {});
    when(mockWatchlistCubit.loadWatchlistStatus(tId)).thenAnswer((_) async {});

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: tId)));
    await tester.pump();

    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
