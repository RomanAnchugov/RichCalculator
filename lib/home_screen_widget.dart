import 'package:flutter/material.dart';
import 'package:rich_calculator/strings/strings.dart';

import 'calculator/widgets/calculator_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(Strings.appTitle),
        ),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Calculator(),
      ),
    );
  }
}
