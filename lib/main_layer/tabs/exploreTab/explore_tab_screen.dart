import 'package:flutter/material.dart';

class ExploreTabScreen extends StatelessWidget {
  const ExploreTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explore'), centerTitle: true),
      body: Center(
        child: Text(
          'Explore Tab Content',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
