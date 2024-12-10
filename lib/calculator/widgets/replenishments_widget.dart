import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:rich_calculator/calculator/model/ReplenishmentPeriod.dart';

import '../../strings/strings.dart';
import '../../utils/log.dart';
import '../bloc/calculator_cubit.dart';

class PeriodicReplenishmentsWidget extends StatefulWidget {
  const PeriodicReplenishmentsWidget({super.key});

  @override
  State<PeriodicReplenishmentsWidget> createState() =>
      _PeriodicReplenishmentsWidgetState();
}

class _PeriodicReplenishmentsWidgetState
    extends State<PeriodicReplenishmentsWidget> {
  Set<ReplenishmentPeriod> selected = <ReplenishmentPeriod>{
    ReplenishmentPeriod.month
  };

  @override
  Widget build(BuildContext context) {
    CalculatorCubit cubit = context.read<CalculatorCubit>();

    return TextField(
      keyboardType: const TextInputType.numberWithOptions(signed: true),
      inputFormatters: [ThousandsFormatter(allowFraction: true)],
      onChanged: (String value) {
        cubit.onReplenishmentCountChange(value);
      },
      decoration: const InputDecoration(
        labelText: Strings.replenishmentCount,
      ),
    );
  }
}
