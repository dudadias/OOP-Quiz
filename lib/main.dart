import 'package:flutter/material.dart';
import 'package:quiz/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData teme = ThemeData();
    return MaterialApp(
      theme: teme.copyWith(
          colorScheme: teme.colorScheme.copyWith(
        primary: Colors.yellow[300],
      )),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: const Home(),
      ),
    );
  }
}
