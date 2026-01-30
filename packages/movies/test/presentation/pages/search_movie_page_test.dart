import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../helpers/cubit_test_helper.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockSearchMoviesCubit mockCubit;

  setUp(() {
    mockCubit = MockSearchMoviesCubit();
    GetIt.I.registerSingleton<SearchMoviesCubit>(mockCubit);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(home: body);
  }

  testWidgets('Should call onQueryChanged when text is entered', (
    tester,
  ) async {
    mockCubitStream(mockCubit, const SearchMoviesState.initial());

    when(mockCubit.onQueryChanged(any)).thenAnswer((_) async {});

    await tester.pumpWidget(_makeTestableWidget(const SearchMoviePage()));

    await tester.enterText(find.byType(TextField), 'Spiderman');
    await tester.testTextInput.receiveAction(TextInputAction.search);

    verify(mockCubit.onQueryChanged('Spiderman')).called(1);
  });
}
