import 'package:flutter/material.dart';

class ProfileTabScreen extends StatelessWidget {
  const ProfileTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: Center(
        child: Text(
          'Profile Tab Content',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
