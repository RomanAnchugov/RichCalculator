import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../utils/log.dart';
import 'bloc/calculator_cubit.dart';

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
          child: () {
            if ((state.result?.sum ?? 0) > 0) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "Result is: ${numberFormatter.format(cubit.state.result!.sum)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          }(),
        );
      },
    );
  }
}
