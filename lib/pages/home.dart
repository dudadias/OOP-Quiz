import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
