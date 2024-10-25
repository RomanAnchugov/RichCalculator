import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rich_calculator/calculator/bloc/calculator_cubit.dart';

import 'home.dart';

void main() {
  runApp(
    MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CalculatorCubit(),
          ),
        ],
        child: HomeScreen(),
      ),
    ),
  );
}
