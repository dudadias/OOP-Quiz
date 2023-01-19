import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Function next;
  const Button({super.key, required this.next, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        next();
      },
      child: Container(
        width: double.infinity,
        height: 60,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        decoration: BoxDecoration(
            color: Colors.yellow[300],
            border: Border.all(color: Colors.yellow, width: 2),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(
                  0,
                  2,
                ),
                blurRadius: 4.0,
              ),
            ]),
        child: Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
