import 'package:flutter/material.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), centerTitle: true),
      body: Center(
        child: Text(
          'Home Tab Content',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
