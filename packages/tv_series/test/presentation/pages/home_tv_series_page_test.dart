import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tv_series/tv_series.dart';

import '../../test_helper/test_helper.mocks.dart';

void main() {
  late MockOnTheAirCubit mockOnTheAirCubit;
  late MockPopularTVSeriesCubit mockPopularTVSeriesCubit;
  late MockTopRatedTVSeriesCubit mockTopRatedTVSeriesCubit;

  setUp(() {
    mockOnTheAirCubit = MockOnTheAirCubit();
    mockPopularTVSeriesCubit = MockPopularTVSeriesCubit();
    mockTopRatedTVSeriesCubit = MockTopRatedTVSeriesCubit();

    GetIt.I.registerFactory<OnTheAirCubit>(() => mockOnTheAirCubit);
    GetIt.I.registerFactory<PopularTVSeriesCubit>(
      () => mockPopularTVSeriesCubit,
    );
    GetIt.I.registerFactory<TopRatedTVSeriesCubit>(
      () => mockTopRatedTVSeriesCubit,
    );

    when(mockOnTheAirCubit.fetchOnTheAirTVSeries()).thenAnswer((_) async {});
    when(
      mockPopularTVSeriesCubit.fetchPopularTVSeries(),
    ).thenAnswer((_) async {});
    when(
      mockTopRatedTVSeriesCubit.fetchTopRatedTVSeries(),
    ).thenAnswer((_) async {});

    when(mockOnTheAirCubit.stream).thenAnswer((_) => const Stream.empty());
    when(
      mockPopularTVSeriesCubit.stream,
    ).thenAnswer((_) => const Stream.empty());
    when(
      mockTopRatedTVSeriesCubit.stream,
    ).thenAnswer((_) => const Stream.empty());
  });

  tearDown(() {
    GetIt.I.reset();
  });

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
  final tTVSeriesList = [tTVSeries];

  Widget makeTestableWidget(Widget body) {
    return MaterialApp(
      home: body,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(body: Text(settings.name!)),
          settings: settings,
        );
      },
    );
  }

  group('HomeTVSeriesPage', () {
    testWidgets(
      'should display loading indicators when all cubits are loading',
      (WidgetTester tester) async {
        // Arrange
        when(mockOnTheAirCubit.state).thenReturn(const OnTheAirState.loading());
        when(
          mockPopularTVSeriesCubit.state,
        ).thenReturn(const PopularTVSeriesState.loading());
        when(
          mockTopRatedTVSeriesCubit.state,
        ).thenReturn(const TopRatedTVSeriesState.loading());

        // Act
        await tester.pumpWidget(makeTestableWidget(const HomeTVSeriesPage()));

        // Assert
        expect(find.byType(CircularProgressIndicator), findsNWidgets(3));
      },
    );

    testWidgets('should display lists when data is loaded', (
      WidgetTester tester,
    ) async {
      // Arrange
      when(
        mockOnTheAirCubit.state,
      ).thenReturn(OnTheAirState.loaded(tTVSeriesList));
      when(
        mockPopularTVSeriesCubit.state,
      ).thenReturn(PopularTVSeriesState.loaded(tTVSeriesList));
      when(
        mockTopRatedTVSeriesCubit.state,
      ).thenReturn(TopRatedTVSeriesState.loaded(tTVSeriesList));

      // Act
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestableWidget(const HomeTVSeriesPage()));
      });

      // Assert
      expect(find.byType(InkWell), findsNWidgets(7));
    });

    testWidgets('should display error text when data failed', (
      WidgetTester tester,
    ) async {
      // Arrange
      when(
        mockOnTheAirCubit.state,
      ).thenReturn(const OnTheAirState.error('Failed'));
      when(
        mockPopularTVSeriesCubit.state,
      ).thenReturn(const PopularTVSeriesState.error('Failed'));
      when(
        mockTopRatedTVSeriesCubit.state,
      ).thenReturn(const TopRatedTVSeriesState.error('Failed'));

      // Act
      await tester.pumpWidget(makeTestableWidget(const HomeTVSeriesPage()));

      // Assert
      expect(find.text('Failed'), findsNWidgets(3));
    });

    testWidgets('should navigate to search page when search icon is tapped', (
      WidgetTester tester,
    ) async {
      // Arrange
      when(mockOnTheAirCubit.state).thenReturn(const OnTheAirState.initial());
      when(
        mockPopularTVSeriesCubit.state,
      ).thenReturn(const PopularTVSeriesState.initial());
      when(
        mockTopRatedTVSeriesCubit.state,
      ).thenReturn(const TopRatedTVSeriesState.initial());

      await tester.pumpWidget(makeTestableWidget(const HomeTVSeriesPage()));

      // Act
      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text(searchTVSeriesRoute), findsOneWidget);
    });

    testWidgets('should navigate to popular page when sub-heading is tapped', (
      WidgetTester tester,
    ) async {
      when(mockOnTheAirCubit.state).thenReturn(const OnTheAirState.initial());
      when(
        mockPopularTVSeriesCubit.state,
      ).thenReturn(const PopularTVSeriesState.initial());
      when(
        mockTopRatedTVSeriesCubit.state,
      ).thenReturn(const TopRatedTVSeriesState.initial());

      await tester.pumpWidget(makeTestableWidget(const HomeTVSeriesPage()));

      final popularSeeMoreFinder = find.text('See More').first;
      await tester.tap(popularSeeMoreFinder);
      await tester.pumpAndSettle();

      expect(find.text(popularTVSeriesRoute), findsOneWidget);
    });

    testWidgets(
      'should navigate to top rated page when sub-heading is tapped',
      (WidgetTester tester) async {
        when(mockOnTheAirCubit.state).thenReturn(const OnTheAirState.initial());
        when(
          mockPopularTVSeriesCubit.state,
        ).thenReturn(const PopularTVSeriesState.initial());
        when(
          mockTopRatedTVSeriesCubit.state,
        ).thenReturn(const TopRatedTVSeriesState.initial());

        await tester.pumpWidget(makeTestableWidget(const HomeTVSeriesPage()));

        final topRatedSeeMoreFinder = find.text('See More').last;
        await tester.tap(topRatedSeeMoreFinder);
        await tester.pumpAndSettle();

        expect(find.text(topRatedMoviesRoute), findsOneWidget);
      },
    );

    testWidgets('should navigate to detail page when item is tapped', (
      WidgetTester tester,
    ) async {
      // Arrange
      when(
        mockOnTheAirCubit.state,
      ).thenReturn(OnTheAirState.loaded(tTVSeriesList));
      when(
        mockPopularTVSeriesCubit.state,
      ).thenReturn(const PopularTVSeriesState.initial());
      when(
        mockTopRatedTVSeriesCubit.state,
      ).thenReturn(const TopRatedTVSeriesState.initial());

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(makeTestableWidget(const HomeTVSeriesPage()));

        final onTheAirListFinder = find.byType(ListView).first;

        final itemFinder = find
            .descendant(of: onTheAirListFinder, matching: find.byType(InkWell))
            .first;

        // Act
        await tester.tap(itemFinder);
        await tester.pumpAndSettle();

        // Assert
        expect(find.text(tvSeriesDetailRoute), findsOneWidget);
      });
    });
  });
}
