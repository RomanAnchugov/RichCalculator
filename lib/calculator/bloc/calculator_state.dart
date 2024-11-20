part of 'calculator_cubit.dart';

class CalculatorState {
  double startMoney = 0;
  int yearsCount = 0;
  double percentage = 0.0;

  double replenishmentCount = 0.0;

  ResultState? result = ResultState();

  CalculatorState copyWith(
      {final double? startMoney,
      final int? yearsCount,
      final double? percentage,
      final ResultState? result,
      final double? replenishmentCount}) {
    return CalculatorState(
      startMoney: startMoney ?? this.startMoney,
      yearsCount: yearsCount ?? this.yearsCount,
      percentage: percentage ?? this.percentage,
      result: result ?? this.result,
      replenishmentCount: replenishmentCount ?? this.replenishmentCount,
    );
  }

  CalculatorState(
      {this.startMoney = 0,
      this.yearsCount = 0,
      this.percentage = 0,
      this.result,
      this.replenishmentCount = 0});
}

class ResultState {
  double sum = 0.0;
  double lastReplenishment = 0.0;
  List<double>? linearReplenishmentsArr = [];
  List<double>? compoundReplenishmentsArr = [];

  ResultState copyWith({
    final double? sum,
    final double? lastReplenishment,
    final List<double>? linearReplenishmentsArr,
    final List<double>? compoundReplenishmentsArr,
  }) {
    return ResultState(
      sum: sum ?? this.sum,
      lastReplenishment: lastReplenishment ?? this.lastReplenishment,
      linearReplenishmentsArr:
          linearReplenishmentsArr ?? this.linearReplenishmentsArr,
      compoundReplenishmentsArr:
          compoundReplenishmentsArr ?? this.compoundReplenishmentsArr,
    );
  }

  List<FlSpot> getCompoundLineSpots() {
    List<FlSpot> result = [];

    for (int i = 0; i < (compoundReplenishmentsArr?.length ?? 0); i++) {
      result.add(FlSpot(i.toDouble(),
          double.parse(compoundReplenishmentsArr![i].toStringAsFixed(1))));
    }

    return result;
  }

  ResultState({
    this.sum = 0.0,
    this.lastReplenishment = 0.0,
    this.linearReplenishmentsArr,
    this.compoundReplenishmentsArr,
  });
}
