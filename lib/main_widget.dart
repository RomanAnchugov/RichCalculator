import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rich_calculator/calculator/bloc/calculator_cubit.dart';

import 'home_screen_widget.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        // Define the default brightness and colors.
        scaffoldBackgroundColor: Colors.orange,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          primary: Colors.black,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange.shade900,
          primary: Colors.grey,
          brightness: Brightness.dark,
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CalculatorCubit(),
          ),
        ],
        child: const HomeScreen(),
      ),
    ),
  );
}
