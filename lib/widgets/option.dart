import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option(
      {super.key,
      required this.e,
      required this.isResondida,
      required this.isSelecionada,
      required this.isCorreta,
      required this.registraResposta});

  final String e;
  final bool isResondida;
  final bool isCorreta;
  final bool isSelecionada;
  final Function registraResposta;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        registraResposta(e);
      },
      child: Container(
        width: double.infinity,
        height: 60,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        decoration: BoxDecoration(
            color: Colors.grey[100],
            border: Border.all(
                color: isResondida
                    ? isSelecionada
                        ? isCorreta
                            ? Colors.green
                            : Colors.red
                        : Colors.white
                    : Colors.white,
                width: 2),
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
          e,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
