import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rich_calculator/calculator/model/ReplenishmentPeriod.dart';

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

  void onReplenishmentCountChange(String count) {
    Log.i("NEW REPL: $count");
    var nonFormated = count.replaceAll(",", "");
    double result = double.tryParse(nonFormated) ?? 0;
    Log.i("FORMATED REPL: $result");
    emit(state.copyWith(replenishmentCount: result));
  }

  void calculateClick() {
    if (state.startMoney <= 0 ||
        state.percentage <= 0 ||
        state.yearsCount <= 0) {
      return;
    }

    double result = state.startMoney;
    double yearlyPercent = 1 + state.percentage / 100;
    double monthPercent = 1 + (state.percentage / 1200);
    double currentRepl = state.replenishmentCount;

    List<double> linearReplenishments = [result];
    List<double> compoundReplenishments = [result];

    for (int i = 1; i <= state.yearsCount; i++) {
      for (int j = 1; j <= 12; j++) {
        result = (result + currentRepl) * monthPercent;
        compoundReplenishments.add(result);
        linearReplenishments
            .add(linearReplenishments[(i - 1) * 12 + (j - 1)] + currentRepl);
      }
    }

    result = double.parse(result.toStringAsFixed(1));

    var newResult = ResultState(
        sum: result,
        lastReplenishment: currentRepl,
        linearReplenishmentsArr: linearReplenishments,
        compoundReplenishmentsArr: compoundReplenishments);

    Log.i(
        "${state.startMoney} ${state.percentage} ${state.yearsCount} ${state.replenishmentCount} ${result.toString()}");

    emit(state.copyWith(result: newResult));
  }
}
