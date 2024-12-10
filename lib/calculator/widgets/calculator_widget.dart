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
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    CalculatorCubit cubit = context.read<CalculatorCubit>();

    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: ListView(
          shrinkWrap: true,
          controller: scrollController,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(
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
                            keyboardType:
                                const TextInputType.numberWithOptions(),
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
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true),
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
                    const PeriodicReplenishmentsWidget(),
                    const SizedBox(
                      height: 24,
                    ),
                    FilledButton(
                      onPressed: () {
                        context.read<CalculatorCubit>().calculateClick();
                      },
                      child: const Text(Strings.calculatorAction),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<CalculatorCubit, CalculatorState>(
              builder: (context, state) {
                return AnimatedOpacity(
                  opacity: state.result != null ? 1 : 0,
                  duration: Duration(milliseconds: 300),
                  onEnd: () => {
                    scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    )
                  },
                  child: CalculationResultCardWidget(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
