import 'package:calculator/resource/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<OperationStates> {
  CalculatorCubit(InitialState) : super(InitialState());
  static CalculatorCubit get(context) => BlocProvider.of(context);
  dynamic result = 0;
  dynamic sum(a, b) {
    result = a + b;
    emit(AdditionState());
  }

  dynamic subtract(a, b) {
    result = a - b;
    emit(SubtractionState());
  }

  dynamic Multiply(a, b) {
    result = a * b;
    emit(MutiplyState());
  }

  dynamic devide(a, b) {
    if (b == 0) {
      emit(ErrorState());
    } else {
      result = a / b;
      emit(DevideState());
    }
  }
}
