import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late WatchlistTVSeriesStatusCubit cubit;
  late MockGetWatchListStatusTVSeries mockGetWatchListStatusTVSeries;
  late MockSaveWatchlistTVSeries mockSaveWatchlistTVSeries;
  late MockRemoveWatchlistTVSeries mockRemoveWatchlistTVSeries;

  setUp(() {
    mockGetWatchListStatusTVSeries = MockGetWatchListStatusTVSeries();
    mockSaveWatchlistTVSeries = MockSaveWatchlistTVSeries();
    mockRemoveWatchlistTVSeries = MockRemoveWatchlistTVSeries();
    cubit = WatchlistTVSeriesStatusCubit(
      getWatchListStatusTVSeries: mockGetWatchListStatusTVSeries,
      saveWatchlistTVSeries: mockSaveWatchlistTVSeries,
      removeWatchlistTVSeries: mockRemoveWatchlistTVSeries,
    );
  });

  const tId = 1;
  const tTVSeriesDetail = TVSeriesDetail(
    adult: false,
    backdropPath: 'backdropPath',
    genres: [Genre(id: 1, name: 'Action')],
    id: 1,
    name: 'name',
    numberOfEpisodes: 1,
    numberOfSeasons: 1,
    originalLanguage: 'en',
    originalName: 'originalName',
    overview: 'overview',
    posterPath: 'posterPath',
    voteAverage: 1,
    voteCount: 1,
    seasons: [],
  );

  group('WatchlistTVSeriesStatusCubit', () {
    test('initial state should be initial', () {
      expect(cubit.state, const WatchlistTVSeriesStatusState.initial());
    });

    // 1. Load Status
    blocTest<WatchlistTVSeriesStatusCubit, WatchlistTVSeriesStatusState>(
      'should emit [IsAdded] with true when status is true',
      build: () {
        when(
          mockGetWatchListStatusTVSeries.execute(tId),
        ).thenAnswer((_) async => true);
        return cubit;
      },
      act: (cubit) => cubit.loadWatchlistStatus(tId),
      expect: () => [const WatchlistTVSeriesStatusState.isAdded(true)],
    );

    // 2. Add Watchlist Success
    blocTest<WatchlistTVSeriesStatusCubit, WatchlistTVSeriesStatusState>(
      'should emit [Message, IsAdded] when add watchlist success',
      build: () {
        // Stub save
        when(
          mockSaveWatchlistTVSeries.execute(tTVSeriesDetail),
        ).thenAnswer((_) async => const Right('Added to Watchlist'));
        // Stub get status (dipanggil otomatis setelah save sukses)
        when(
          mockGetWatchListStatusTVSeries.execute(tId),
        ).thenAnswer((_) async => true);
        return cubit;
      },
      act: (cubit) => cubit.addWatchlist(tTVSeriesDetail),
      expect: () => [
        const WatchlistTVSeriesStatusState.message('Added to Watchlist'),
        const WatchlistTVSeriesStatusState.isAdded(true),
      ],
      verify: (_) {
        verify(mockSaveWatchlistTVSeries.execute(tTVSeriesDetail));
        verify(mockGetWatchListStatusTVSeries.execute(tId));
      },
    );

    // 3. Add Watchlist Failed
    blocTest<WatchlistTVSeriesStatusCubit, WatchlistTVSeriesStatusState>(
      'should emit [Message] when add watchlist failed',
      build: () {
        when(
          mockSaveWatchlistTVSeries.execute(tTVSeriesDetail),
        ).thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
        return cubit;
      },
      act: (cubit) => cubit.addWatchlist(tTVSeriesDetail),
      expect: () => [const WatchlistTVSeriesStatusState.message('Failed')],
    );

    // 4. Remove Watchlist Success
    blocTest<WatchlistTVSeriesStatusCubit, WatchlistTVSeriesStatusState>(
      'should emit [Message, IsAdded] when remove watchlist success',
      build: () {
        // Stub remove
        when(
          mockRemoveWatchlistTVSeries.execute(tTVSeriesDetail),
        ).thenAnswer((_) async => const Right('Removed from Watchlist'));
        // Stub get status (dipanggil otomatis setelah remove sukses)
        when(
          mockGetWatchListStatusTVSeries.execute(tId),
        ).thenAnswer((_) async => false);
        return cubit;
      },
      act: (cubit) => cubit.removeFromWatchlist(tTVSeriesDetail),
      expect: () => [
        const WatchlistTVSeriesStatusState.message('Removed from Watchlist'),
        const WatchlistTVSeriesStatusState.isAdded(false),
      ],
      verify: (_) {
        verify(mockRemoveWatchlistTVSeries.execute(tTVSeriesDetail));
        verify(mockGetWatchListStatusTVSeries.execute(tId));
      },
    );

    // 5. Remove Watchlist Failed
    blocTest<WatchlistTVSeriesStatusCubit, WatchlistTVSeriesStatusState>(
      'should emit [Message] when remove watchlist failed',
      build: () {
        when(
          mockRemoveWatchlistTVSeries.execute(tTVSeriesDetail),
        ).thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
        return cubit;
      },
      act: (cubit) => cubit.removeFromWatchlist(tTVSeriesDetail),
      expect: () => [const WatchlistTVSeriesStatusState.message('Failed')],
    );
  });
}
