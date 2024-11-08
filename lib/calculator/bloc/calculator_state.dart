part of 'calculator_cubit.dart';

class CalculatorState {
  double startMoney = 0;
  int yearsCount = 0;
  double percentage = 0.0;

  bool isWithReplenishments = false;
  double replenishmentCount = 0.0;

  bool isWithReplIndexation = false;

  ResultState? result = ResultState();

  CalculatorState copyWith(
      {final double? startMoney,
      final int? yearsCount,
      final double? percentage,
      final ResultState? result,
      final bool? isWithReplenishments,
      final double? replenishmentCount,
      final bool? isWithReplIndexation}) {
    return CalculatorState(
      startMoney: startMoney ?? this.startMoney,
      yearsCount: yearsCount ?? this.yearsCount,
      percentage: percentage ?? this.percentage,
      result: result ?? this.result,
      isWithReplenishments: isWithReplenishments ?? this.isWithReplenishments,
      replenishmentCount: replenishmentCount ?? this.replenishmentCount,
      isWithReplIndexation: isWithReplIndexation ?? this.isWithReplIndexation,
    );
  }

  CalculatorState updateResult({final double? sum}) {
    return copyWith(
        result: result?.copyWith(sum: sum) ?? ResultState(sum: sum ?? 0.0));
  }

  CalculatorState(
      {this.startMoney = 0,
      this.yearsCount = 0,
      this.percentage = 0,
      this.result,
      this.isWithReplenishments = false,
      this.replenishmentCount = 0,
      this.isWithReplIndexation = false});
}

class ResultState {
  double sum = 0.0;

  ResultState copyWith({final double? sum}) {
    Log.i("copyWith(): from ${this.sum} to ${sum}");
    return ResultState(sum: sum ?? this.sum);
  }

  ResultState({this.sum = 0.0});
}
