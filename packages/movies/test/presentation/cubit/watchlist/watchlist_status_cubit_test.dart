import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late WatchlistStatusCubit cubit;
  late MockGetWatchListStatus mockGetWatchListStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;

  setUp(() {
    mockGetWatchListStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveWatchlist();
    mockRemoveWatchlist = MockRemoveWatchlist();
    cubit = WatchlistStatusCubit(
      getWatchListStatus: mockGetWatchListStatus,
      saveWatchlist: mockSaveWatchlist,
      removeWatchlist: mockRemoveWatchlist,
    );
  });

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

  group('WatchlistStatusCubit', () {
    test('initial state should be initial', () {
      expect(cubit.state, const WatchlistStatusState.initial());
    });

    blocTest<WatchlistStatusCubit, WatchlistStatusState>(
      'Should emit [IsAdded] when get status is successful',
      build: () {
        when(mockGetWatchListStatus.execute(tId)).thenAnswer((_) async => true);
        return cubit;
      },
      act: (cubit) => cubit.loadWatchlistStatus(tId),
      expect: () => [const WatchlistStatusState.isAdded(true)],
    );

    blocTest<WatchlistStatusCubit, WatchlistStatusState>(
      'Should emit [Message, IsAdded] when save is successful',
      build: () {
        when(
          mockSaveWatchlist.execute(tMovieDetail),
        ).thenAnswer((_) async => const Right('Success'));
        when(mockGetWatchListStatus.execute(tId)).thenAnswer((_) async => true);
        return cubit;
      },
      act: (cubit) => cubit.addWatchlist(tMovieDetail),
      expect: () => [
        const WatchlistStatusState.message('Success'),
        const WatchlistStatusState.isAdded(true),
      ],
    );

    blocTest<WatchlistStatusCubit, WatchlistStatusState>(
      'Should emit [Message] when save fails',
      build: () {
        when(
          mockSaveWatchlist.execute(tMovieDetail),
        ).thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
        return cubit;
      },
      act: (cubit) => cubit.addWatchlist(tMovieDetail),
      expect: () => [const WatchlistStatusState.message('Failed')],
    );

    blocTest<WatchlistStatusCubit, WatchlistStatusState>(
      'Should emit [Message, IsAdded] when remove is successful',
      build: () {
        when(
          mockRemoveWatchlist.execute(tMovieDetail),
        ).thenAnswer((_) async => const Right('Removed'));
        when(
          mockGetWatchListStatus.execute(tId),
        ).thenAnswer((_) async => false);
        return cubit;
      },
      act: (cubit) => cubit.removeFromWatchlist(tMovieDetail),
      expect: () => [
        const WatchlistStatusState.message('Removed'),
        const WatchlistStatusState.isAdded(false),
      ],
    );

    blocTest<WatchlistStatusCubit, WatchlistStatusState>(
      'Should emit [Message] when remove fails',
      build: () {
        when(
          mockRemoveWatchlist.execute(tMovieDetail),
        ).thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
        return cubit;
      },
      act: (cubit) => cubit.removeFromWatchlist(tMovieDetail),
      expect: () => [const WatchlistStatusState.message('Failed')],
    );
  });
}
