import 'package:calculator/resource/operations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(InitialState());
  static CounterCubit get(context) => BlocProvider.of(context);
  int result = 0;
  void sum(a, b) {
    result = a + b;
    emit(AdditionState());
  }

  void subtract(a, b) {
    result = a - b;
    emit(SubtractionState());
  }
}
