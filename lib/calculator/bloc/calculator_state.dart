part of 'calculator_cubit.dart';

class CalculatorState {
  double startMoney = 10;
  int yearsCount = 10;
  double percentage = 10.0;

  int result = 0;

  CalculatorState copyWith({final double? startMoney,
    final int? yearsCount,
    final double? percentage,
    final int? result}) {
    return CalculatorState(
        startMoney: startMoney ?? this.startMoney,
        yearsCount: yearsCount ?? this.yearsCount,
        percentage: percentage ?? this.percentage,
        result: result ?? this.result
    );
  }

  CalculatorState({this.startMoney = 0,
    this.yearsCount = 0,
    this.percentage = 0,
    this.result = 0});
}
