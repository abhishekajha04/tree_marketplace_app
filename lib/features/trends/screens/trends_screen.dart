import 'package:flutter/material.dart';

class TrendsScreen extends StatelessWidget {
  const TrendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trends')),
      body: const Center(
        child: Text(
          'Trends Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

