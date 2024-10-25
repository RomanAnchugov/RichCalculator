import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rich_calculator/calculator/bloc/calculator_cubit.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    CalculatorCubit cubit = context.read<CalculatorCubit>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BlocBuilder<CalculatorCubit, int>(
                builder: (context, state) {
                  return TextField(
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      labelText: 'Start money $state',
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 24,
              ),
              const Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        labelText: 'Percent',
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
                      decoration: InputDecoration(
                        labelText: 'Years count',
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Align(
                  alignment: Alignment.centerLeft, child: Text("Result is: ")),
              const SizedBox(
                height: 24,
              ),
              FilledButton(
                  onPressed: () {
                    cubit.increment(1999);
                  },
                  child: const Text("Make me RICH!"))
            ],
          ),
        ),
      ),
    );
  }
}
