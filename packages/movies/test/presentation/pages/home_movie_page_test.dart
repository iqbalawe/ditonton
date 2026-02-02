import 'dart:async';
import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockNowPlayingCubit mockNowPlayingCubit;
  late MockPopularCubit mockPopularCubit;
  late MockTopRatedCubit mockTopRatedCubit;

  setUpAll(() {
    HttpOverrides.global = _MyHttpOverrides();
  });

  setUp(() {
    mockNowPlayingCubit = MockNowPlayingCubit();
    mockPopularCubit = MockPopularCubit();
    mockTopRatedCubit = MockTopRatedCubit();

    final di = GetIt.instance;
    if (di.isRegistered<NowPlayingCubit>()) di.unregister<NowPlayingCubit>();
    if (di.isRegistered<PopularCubit>()) di.unregister<PopularCubit>();
    if (di.isRegistered<TopRatedCubit>()) di.unregister<TopRatedCubit>();

    di.registerFactory<NowPlayingCubit>(() => mockNowPlayingCubit);
    di.registerFactory<PopularCubit>(() => mockPopularCubit);
    di.registerFactory<TopRatedCubit>(() => mockTopRatedCubit);
  });

  void _stubCubit({
    required NowPlayingState nowPlayingState,
    required PopularState popularState,
    required TopRatedState topRatedState,
  }) {
    when(
      mockNowPlayingCubit.stream,
    ).thenAnswer((_) => Stream.value(nowPlayingState));
    when(mockNowPlayingCubit.state).thenReturn(nowPlayingState);
    when(mockNowPlayingCubit.fetchNowPlayingMovies()).thenAnswer((_) async {});
    when(mockNowPlayingCubit.close()).thenAnswer((_) async {});

    when(mockPopularCubit.stream).thenAnswer((_) => Stream.value(popularState));
    when(mockPopularCubit.state).thenReturn(popularState);
    when(mockPopularCubit.fetchPopularMovies()).thenAnswer((_) async {});
    when(mockPopularCubit.close()).thenAnswer((_) async {});

    when(
      mockTopRatedCubit.stream,
    ).thenAnswer((_) => Stream.value(topRatedState));
    when(mockTopRatedCubit.state).thenReturn(topRatedState);
    when(mockTopRatedCubit.fetchTopRatedMovies()).thenAnswer((_) async {});
    when(mockTopRatedCubit.close()).thenAnswer((_) async {});
  }

  Widget _createTestableWidget(Widget body) {
    return MaterialApp(
      home: body,
      routes: {
        searchMovieRoute: (_) =>
            Scaffold(appBar: AppBar(), body: const Text('Search Page')),
        popularMoviesRoute: (_) =>
            Scaffold(appBar: AppBar(), body: const Text('Popular Page')),
        topRatedMoviesRoute: (_) =>
            Scaffold(appBar: AppBar(), body: const Text('Top Rated Page')),
        movieDetailRoute: (_) =>
            Scaffold(appBar: AppBar(), body: const Text('Detail Page')),
      },
    );
  }

  final tMovies = <Movie>[
    Movie(
      adult: false,
      backdropPath: '/muthafazh.jpg',
      genreIds: const [1, 2],
      id: 1,
      originalTitle: 'Original Title',
      overview: 'Overview',
      popularity: 1,
      posterPath: '/poster.jpg',
      releaseDate: '2022-01-01',
      title: 'Title',
      video: false,
      voteAverage: 1,
      voteCount: 1,
    ),
  ];

  group('HomeMoviePage Widget Tests', () {
    testWidgets(
      'Page should display loading indicators when all cubits are loading',
      (WidgetTester tester) async {
        _stubCubit(
          nowPlayingState: const NowPlayingState.loading(),
          popularState: const PopularState.loading(),
          topRatedState: const TopRatedState.loading(),
        );

        await tester.pumpWidget(_createTestableWidget(const HomeMoviePage()));

        expect(find.byType(CircularProgressIndicator), findsNWidgets(3));
      },
    );

    testWidgets('Page should display error text when all cubits are error', (
      WidgetTester tester,
    ) async {
      _stubCubit(
        nowPlayingState: const NowPlayingState.error('Error'),
        popularState: const PopularState.error('Error'),
        topRatedState: const TopRatedState.error('Error'),
      );

      await tester.pumpWidget(_createTestableWidget(const HomeMoviePage()));

      expect(find.text('Failed'), findsNWidgets(3));
    });

    testWidgets(
      'Page should display list of movies and handle interactions when loaded',
      (WidgetTester tester) async {
        // Arrange
        _stubCubit(
          nowPlayingState: NowPlayingState.loaded(tMovies),
          popularState: PopularState.loaded(tMovies),
          topRatedState: TopRatedState.loaded(tMovies),
        );

        // Act
        await tester.pumpWidget(_createTestableWidget(const HomeMoviePage()));
        await tester.pump();

        // Assert
        expect(find.byType(ListView), findsWidgets);

        final mainScrollable = find.byType(Scrollable).first;

        await tester.tap(find.byIcon(Icons.search));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 800));
        expect(find.text('Search Page'), findsOneWidget);

        await tester.pageBack();
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 800));

        final seeMorePopular = find.text('See More').first;

        await tester.scrollUntilVisible(
          seeMorePopular,
          500,
          scrollable: mainScrollable,
        );

        await tester.tap(seeMorePopular);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 800));
        expect(find.text('Popular Page'), findsOneWidget);

        await tester.pageBack();
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 800));

        final seeMoreTopRated = find.text('See More').at(1);

        await tester.scrollUntilVisible(
          seeMoreTopRated,
          500,
          scrollable: mainScrollable,
        );

        await tester.tap(seeMoreTopRated);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 800));
        expect(find.text('Top Rated Page'), findsOneWidget);

        await tester.pageBack();
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 800));

        final movieCard = find.byType(InkWell).first;

        await tester.scrollUntilVisible(
          movieCard,
          500,
          scrollable: mainScrollable,
        );

        await tester.tap(movieCard);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 800));
        expect(find.text('Detail Page'), findsOneWidget);
      },
    );

    testWidgets('Page should display SizedBox when state is initial', (
      tester,
    ) async {
      _stubCubit(
        nowPlayingState: const NowPlayingState.initial(),
        popularState: const PopularState.initial(),
        topRatedState: const TopRatedState.initial(),
      );

      await tester.pumpWidget(_createTestableWidget(const HomeMoviePage()));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Failed'), findsNothing);
    });
  });
}

class _MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return _MyHttpClient();
  }
}

class _MyHttpClient extends Mock implements HttpClient {
  @override
  Future<HttpClientRequest> getUrl(Uri url) {
    return Future.value(_MyHttpClientRequest());
  }
}

class _MyHttpClientRequest extends Mock implements HttpClientRequest {
  @override
  Future<HttpClientResponse> close() {
    return Future.value(_MyHttpClientResponse());
  }
}

class _MyHttpClientResponse extends Mock implements HttpClientResponse {
  @override
  int get statusCode => 200;

  @override
  int get contentLength => 0;

  @override
  HttpClientResponseCompressionState get compressionState =>
      HttpClientResponseCompressionState.notCompressed;

  @override
  StreamSubscription<List<int>> listen(
    void Function(List<int> event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return Stream.value(<int>[]).listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }
}
