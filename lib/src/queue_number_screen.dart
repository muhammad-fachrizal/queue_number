import 'dart:math';
import 'package:flutter/material.dart';
import 'package:queue_number/src/theme_manager/text_style_manager.dart';

class QueueNumberScreen extends StatelessWidget {
  final String fullName;
  const QueueNumberScreen({super.key, required this.fullName});

  @override
  Widget build(BuildContext context) {
    int queueNumber = Random().nextInt(10) + 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Queue Number',
        ),
      ),
      body: SafeArea(
          minimum: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  '''Hi, $fullName!
Please wait, 
Your queue number is:''',
                  style: getRubikTextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    '$queueNumber',
                    style: getRubikTextStyle(
                      fontSize: 231,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
          },
          label: const Row(
            children: [
              Icon(Icons.home),
              SizedBox(
                width: 8,
              ),
              Text('Home'),
            ],
          )),
    );
  }
}
