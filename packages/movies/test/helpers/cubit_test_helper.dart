import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';

void mockCubitStream<S>(BlocBase<S> cubit, S state) {
  when(cubit.stream).thenAnswer((_) => Stream.value(state));
  when(cubit.state).thenReturn(state);
  when(cubit.close()).thenAnswer((_) async {});
}
