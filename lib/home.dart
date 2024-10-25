import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rich_calculator/calculator/bloc/calculator_cubit.dart';

import 'calculator/calculator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Center(
            child: Calculator()),
        color: Colors.amber,
      ),
    );
  }
}
