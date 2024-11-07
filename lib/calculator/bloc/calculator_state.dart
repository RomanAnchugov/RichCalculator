part of 'calculator_cubit.dart';

class CalculatorState {
  double startMoney = 0;
  int yearsCount = 0;
  double percentage = 0.0;

  double result = 0;

  bool isWithReplenishments = false;
  ReplenishmentPeriod period = ReplenishmentPeriod.month;
  double replenishmentCount = 0.0;

  bool isWithReplIndexation = false;

  CalculatorState copyWith(
      {final double? startMoney,
      final int? yearsCount,
      final double? percentage,
      final double? result,
      final bool? isWithReplenishments,
      final ReplenishmentPeriod? period,
      final double? replenishmentCount,
      final bool? isWithReplIndexation}) {
    return CalculatorState(
      startMoney: startMoney ?? this.startMoney,
      yearsCount: yearsCount ?? this.yearsCount,
      percentage: percentage ?? this.percentage,
      result: result ?? this.result,
      isWithReplenishments: isWithReplenishments ?? this.isWithReplenishments,
      period: period ?? this.period,
      replenishmentCount: replenishmentCount ?? this.replenishmentCount,
      isWithReplIndexation: isWithReplIndexation ?? this.isWithReplIndexation,
    );
  }

  CalculatorState(
      {this.startMoney = 0,
      this.yearsCount = 0,
      this.percentage = 0,
      this.result = 0,
      this.isWithReplenishments = false,
      this.period = ReplenishmentPeriod.month,
      this.replenishmentCount = 0,
      this.isWithReplIndexation = false});
}
