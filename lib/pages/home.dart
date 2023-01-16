import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/repository/questions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Question> perguntas = QuestionsRepository().createQuestions(5);
  int perguntaAtual = 0;

  void proximaPergunta() {
    setState(() {
      if (perguntaAtual < perguntas.length - 1) {
        perguntaAtual += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${perguntaAtual + 1} / ${perguntas.length}",
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            perguntas[perguntaAtual].utterance,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              proximaPergunta();
            },
            child: Text(perguntas[perguntaAtual].options[0]),
          ),
          ElevatedButton(
            onPressed: () {
              proximaPergunta();
            },
            child: Text(perguntas[perguntaAtual].options[1]),
          ),
          ElevatedButton(
            onPressed: () {
              proximaPergunta();
            },
            child: Text(perguntas[perguntaAtual].options[2]),
          ),
          ElevatedButton(
            onPressed: () {
              proximaPergunta();
            },
            child: Text(perguntas[perguntaAtual].options[3]),
          ),
        ],
      ),
    );
  }
}
