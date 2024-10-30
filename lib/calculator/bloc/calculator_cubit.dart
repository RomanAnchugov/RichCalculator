import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/log.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorState());

  void startMoneySet(String startMoney) {
    var nonFormated = startMoney.replaceAll(",", "");
    double? result = double.tryParse(nonFormated);
    if (result != null) {
      emit(state.copyWith(startMoney: result));
    }
  }

  void percentageSet(String percentage) {
    var nonFormated = percentage.replaceAll(",", "");
    double? result = double.tryParse(nonFormated);
    if (result != null) {
      emit(state.copyWith(percentage: result));
    }
  }

  void yearsCountSet(String yearsCount) {
    var nonFormated = yearsCount.replaceAll(",", "");
    int? result = int.tryParse(nonFormated);
    if (result != null) {
      emit(state.copyWith(yearsCount: result));
    }
  }

  void calculateClick() {
    var result =
        (state.startMoney * pow((1 + state.percentage / 100), state.yearsCount))
            .toInt();

    Log.i(
        "${state.startMoney} ${state.percentage} ${state.yearsCount} ${result.toString()}");

    state.result = result;

    emit(state.copyWith(result: result));
  }
}
