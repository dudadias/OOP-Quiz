import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Question 01",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("answer01"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("answer02"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("answer03"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("answer04"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
