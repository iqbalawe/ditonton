import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetWatchListStatus mockGetWatchListStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;
  late WatchlistStatusCubit watchlistStatusCubit;

  setUp(() {
    mockGetWatchListStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveWatchlist();
    mockRemoveWatchlist = MockRemoveWatchlist();
    watchlistStatusCubit = WatchlistStatusCubit(
      getWatchListStatus: mockGetWatchListStatus,
      saveWatchlist: mockSaveWatchlist,
      removeWatchlist: mockRemoveWatchlist,
    );
  });

  final tMovieDetail = MovieDetail(
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

  group('WatchlistStatusCubit', () {
    const tId = 1;

    test('initial state should be initial', () {
      expect(watchlistStatusCubit.state, const WatchlistStatusState.initial());
    });

    blocTest<WatchlistStatusCubit, WatchlistStatusState>(
      'Should emit [IsAdded] when get watchlist status is true',
      build: () {
        when(mockGetWatchListStatus.execute(tId)).thenAnswer((_) async => true);
        return watchlistStatusCubit;
      },
      act: (cubit) => cubit.loadWatchlistStatus(tId),
      expect: () => [const WatchlistStatusState.isAdded(true)],
    );

    blocTest<WatchlistStatusCubit, WatchlistStatusState>(
      'Should emit [Message, IsAdded] when save watchlist is successful',
      build: () {
        when(
          mockSaveWatchlist.execute(tMovieDetail),
        ).thenAnswer((_) async => const Right('Added to Watchlist'));
        when(
          mockGetWatchListStatus.execute(tMovieDetail.id),
        ).thenAnswer((_) async => true);
        return watchlistStatusCubit;
      },
      act: (cubit) => cubit.addWatchlist(tMovieDetail),
      expect: () => [
        const WatchlistStatusState.message('Added to Watchlist'),
        const WatchlistStatusState.isAdded(true),
      ],
    );

    blocTest<WatchlistStatusCubit, WatchlistStatusState>(
      'Should emit [Message] only when save watchlist failed',
      build: () {
        when(
          mockSaveWatchlist.execute(tMovieDetail),
        ).thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
        return watchlistStatusCubit;
      },
      act: (cubit) => cubit.addWatchlist(tMovieDetail),
      expect: () => [const WatchlistStatusState.message('Failed')],
    );
  });
}
