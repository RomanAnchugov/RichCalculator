import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../utils/log.dart';
import '../bloc/calculator_cubit.dart';

class CalculationResultCardWidget extends StatelessWidget {
  const CalculationResultCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CalculatorCubit cubit = context.read<CalculatorCubit>();
    var numberFormatter = NumberFormat.decimalPattern();

    return BlocBuilder<CalculatorCubit, CalculatorState>(
      builder: (context, state) {
        Log.i("build blyat: ${state.result}");
        return Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Column(
              children: [
                () {
                  if ((state.result?.sum ?? 0) > 0) {
                    return Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(
                        "${numberFormatter.format(cubit.state.result!.sum)}₽",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }(),
                SizedBox(
                  height: 300,
                  child: LineChart(
                    LineChartData(
                      titlesData: const FlTitlesData(
                          leftTitles:
                              AxisTitles(axisNameWidget: SizedBox.shrink()),
                          bottomTitles:
                              AxisTitles(axisNameWidget: SizedBox.shrink()),
                          topTitles:
                              AxisTitles(axisNameWidget: SizedBox.shrink())),
                      borderData: FlBorderData(
                          border: const Border(
                              right: BorderSide(color: Colors.black, width: 2),
                              bottom:
                                  BorderSide(color: Colors.black, width: 2))),
                      lineBarsData: [
                        LineChartBarData(
                          isCurved: true,
                          color: Colors.amberAccent,
                          barWidth: 1,
                          belowBarData: BarAreaData(show: true),
                          spots: state.result?.getCompoundLineSpots() ?? [],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
