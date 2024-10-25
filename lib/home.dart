import 'package:flutter/material.dart';

import 'calculator/calculator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Container(
        color: Colors.amber,
        child: const Center(
            child: Calculator()),
      ),
    );
  }
}
