import 'package:flutter/material.dart';

class SearchTabScreen extends StatelessWidget {
  const SearchTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search'), centerTitle: true),
      body: Center(
        child: Text(
          'Search Tab Content',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
