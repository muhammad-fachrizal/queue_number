import 'package:flutter/material.dart';
import 'package:queue_number/src/main_screen.dart';
import 'package:queue_number/src/personal_information_screen.dart';
import 'package:queue_number/src/queue_number_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Queue Number',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/mainScreen',
      routes: {
        '/mainScreen': (context) => const MainScreen(),
        '/personalInformation': (context) => const PersonalInformation(),
        '/queueNumberScreen': (context) => QueueNumberScreen(
            fullName: ModalRoute.of(context)?.settings.arguments as String),
      },
    );
  }
}
