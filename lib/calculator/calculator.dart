import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:rich_calculator/calculator/bloc/calculator_cubit.dart';

import '../strings/strings.dart';
import '../utils/log.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    CalculatorCubit cubit = context.read<CalculatorCubit>();
    var numberFormatter = NumberFormat.decimalPattern();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                keyboardType: const TextInputType.numberWithOptions(),
                inputFormatters: [
                  ThousandsFormatter(allowFraction: true),
                ],
                onChanged: (String value) {
                  cubit.startMoneySet(value);
                },
                decoration: const InputDecoration(
                  labelText: Strings.startMoney,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      inputFormatters: [
                        ThousandsFormatter(allowFraction: true)
                      ],
                      keyboardType: const TextInputType.numberWithOptions(),
                      onChanged: (String value) {
                        cubit.percentageSet(value);
                      },
                      decoration: const InputDecoration(
                        labelText: Strings.percentage,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType:
                          const TextInputType.numberWithOptions(signed: true),
                      inputFormatters: [
                        ThousandsFormatter(allowFraction: true)
                      ],
                      onChanged: (String value) {
                        cubit.yearsCountSet(value);
                      },
                      decoration: const InputDecoration(
                        labelText: Strings.yearsCount,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              BlocBuilder<CalculatorCubit, CalculatorState>(
                builder: (context, state) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "Result is: ${numberFormatter.format(cubit.state.result)}"),
                  );
                },
              ),
              const SizedBox(
                height: 24,
              ),
              FilledButton(
                onPressed: () {
                  context.read<CalculatorCubit>().calculateClick();
                },
                child: const Text(Strings.calculatorAction),
              )
            ],
          ),
        ),
      ),
    );
  }
}
