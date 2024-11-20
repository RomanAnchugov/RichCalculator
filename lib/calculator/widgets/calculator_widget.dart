import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:rich_calculator/calculator/bloc/calculator_cubit.dart';
import 'package:rich_calculator/calculator/widgets/replenishments_widget.dart';
import 'package:rich_calculator/calculator/widgets/result_card_widget.dart';

import '../../strings/strings.dart';
import '../../utils/log.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    CalculatorCubit cubit = context.read<CalculatorCubit>();

    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: Strings.startMoney,
                      ),
                      keyboardType: const TextInputType.numberWithOptions(),
                      inputFormatters: [
                        ThousandsFormatter(allowFraction: true),
                      ],
                      onChanged: (String value) {
                        cubit.startMoneySet(value);
                      },
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
                            keyboardType: TextInputType.numberWithOptions(),
                            onChanged: (String value) {
                              cubit.percentageSet(value);
                            },
                            decoration: InputDecoration(
                              labelText: Strings.percentage,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 32,
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType:
                                TextInputType.numberWithOptions(signed: true),
                            inputFormatters: [
                              ThousandsFormatter(allowFraction: true)
                            ],
                            onChanged: (String value) {
                              cubit.yearsCountSet(value);
                            },
                            decoration: InputDecoration(
                              labelText: Strings.yearsCount,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    PeriodicReplenishmentsWidget(),
                    SizedBox(
                      height: 24,
                    ),
                    FilledButton(
                      onPressed: () {
                        context.read<CalculatorCubit>().calculateClick();
                      },
                      child: Text(Strings.calculatorAction),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<CalculatorCubit, CalculatorState>(
              builder: (context, state) {
                if (state.result != null) {
                  return CalculationResultCardWidget();
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
