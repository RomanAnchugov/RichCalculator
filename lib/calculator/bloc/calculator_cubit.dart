import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
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

  void onWithReplenishmentsChanged(bool newValue) {
    emit(state.copyWith(isWithReplenishments: newValue));
  }

  void onReplenishmentCountChange(String count) {
    var nonFormated = count.replaceAll(",", "");
    double? result = double.tryParse(nonFormated);
    emit(state.copyWith(replenishmentCount: result));
  }

  void onReplIndexationChange(bool newValue) {
    emit(state.copyWith(isWithReplIndexation: newValue));
  }

  void calculateClick() {
    double? result = state.startMoney;
    double yearlyPercent = 1 + state.percentage / 100;
    double monthPercent = 1 + (state.percentage / 1200);
    double currentRepl = state.replenishmentCount;

    if (state.isWithReplenishments) {
      for (int i = 1; i <= state.yearsCount; i++) {
        for (int j = 1; j <= 12; j++) {
          result = (result! + currentRepl) * monthPercent;
        }
        if (state.isWithReplIndexation) {
          currentRepl *= yearlyPercent;
        }
      }
    } else {
      result = state.startMoney *
          pow((1 + state.percentage / 100), state.yearsCount);
    }

    Log.i(
        "${state.startMoney} ${state.percentage} ${state.yearsCount} ${state.replenishmentCount} ${result.toString()}");

    emit(state.updateResult(sum: result));
  }
}
