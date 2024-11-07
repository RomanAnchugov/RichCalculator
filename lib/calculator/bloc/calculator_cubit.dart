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

  void onReplenishmentPeriodChange(ReplenishmentPeriod period) {
    emit(state.copyWith(period: period));
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
    double? result = 0;
    double yearlyPercent = 1 + state.percentage / 100;

    if (state.isWithReplenishments) {
      switch (state.period) {
        case ReplenishmentPeriod.day:
          double dailyPercents = (1 + state.percentage / (100 * 365));
          result =
              (state.startMoney + state.replenishmentCount) * dailyPercents;
          double currentRepl = state.replenishmentCount;
          for (int j = 1; j < state.yearsCount; j++) {
            for (int i = 1; i <= 365; i++) {
              result = (result! + currentRepl) * dailyPercents;
            }
            currentRepl *= yearlyPercent;
          }
        case ReplenishmentPeriod.month:
          double monthlyPercents = (1 + state.percentage / (100 * 12));
          result =
              (state.startMoney + state.replenishmentCount) * monthlyPercents;
          double currentRepl = state.replenishmentCount;
          for (int j = 1; j < state.yearsCount; j++) {
            for (int i = 1; i <= 12; i++) {
              result = (result! + currentRepl) * monthlyPercents;
            }
            currentRepl *= yearlyPercent;
          }
        case ReplenishmentPeriod.year:
          double yearlyPercents = (1 + state.percentage / 100);
          result =
              (state.startMoney + state.replenishmentCount) * yearlyPercents;
          double currentRepl = state.replenishmentCount;
          for (int i = 1; i < state.yearsCount; i++) {
            result = (result! + currentRepl) * yearlyPercents;
            currentRepl *= yearlyPercent;
          }
      }
    } else {
      result = state.startMoney *
          pow((1 + state.percentage / 100), state.yearsCount);
    }

    Log.i(
        "${state.startMoney} ${state.percentage} ${state.yearsCount} ${state.period.name} ${state.replenishmentCount} ${result.toString()}");

    emit(state.copyWith(result: result));
  }
}
