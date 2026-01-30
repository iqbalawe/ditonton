import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../helpers/cubit_test_helper.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockNowPlayingCubit mockNowPlayingCubit;
  late MockPopularCubit mockPopularCubit;
  late MockTopRatedCubit mockTopRatedCubit;

  setUp(() {
    mockNowPlayingCubit = MockNowPlayingCubit();
    mockPopularCubit = MockPopularCubit();
    mockTopRatedCubit = MockTopRatedCubit();

    GetIt.I.registerSingleton<NowPlayingCubit>(mockNowPlayingCubit);
    GetIt.I.registerSingleton<PopularCubit>(mockPopularCubit);
    GetIt.I.registerSingleton<TopRatedCubit>(mockTopRatedCubit);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(home: body);
  }

  testWidgets(
    'Page should display ListView/HorizontalList when data is loaded',
    (tester) async {
      mockCubitStream(mockNowPlayingCubit, const NowPlayingState.loaded([]));
      mockCubitStream(mockPopularCubit, const PopularState.loaded([]));
      mockCubitStream(mockTopRatedCubit, const TopRatedState.loaded([]));

      when(
        mockNowPlayingCubit.fetchNowPlayingMovies(),
      ).thenAnswer((_) async {});
      when(mockPopularCubit.fetchPopularMovies()).thenAnswer((_) async {});
      when(mockTopRatedCubit.fetchTopRatedMovies()).thenAnswer((_) async {});

      await tester.pumpWidget(_makeTestableWidget(const HomeMoviePage()));

      expect(find.byType(ListView), findsWidgets);
      expect(find.text('Now Playing'), findsOneWidget);
    },
  );
}
