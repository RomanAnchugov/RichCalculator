import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorState());

  void startMoneySet(int? startMoney) {
    emit(state.copyWith(startMoney: startMoney));
  }

  void percentageSet(double? percentage) {
    emit(state.copyWith(percentage: percentage));
  }

  void yearsCountSet(int? yearsCount) {
    emit(state.copyWith(yearsCount: yearsCount));
  }

  void calculateClick() {
    var result =
        (state.startMoney * pow((1 + state.percentage / 100), state.yearsCount))
            .toInt();

    state.result = result;

    emit(state.copyWith(result: result));
  }
}
