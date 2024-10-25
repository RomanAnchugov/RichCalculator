import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<int> {
  CalculatorCubit() : super(0);

  void increment(int startMoney) => emit(state + startMoney);
}
