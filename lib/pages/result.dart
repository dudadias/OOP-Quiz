import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int acertos;
  final Function novo;
  const Result({super.key, required this.acertos, required this.novo});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Congrats! ",
            style: TextStyle(fontSize: 35),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "$acertos/5 points",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              novo();
            },
            child: const Text("Play Again"),
          ),
        ],
      ),
    );
  }
}
