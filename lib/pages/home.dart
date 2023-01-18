import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/repository/questions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

enum StatusPergunta { aguardando, respondida }

class _HomeState extends State<Home> {
  final List<Question> perguntas = QuestionsRepository().createQuestions(5);
  int perguntaAtual = 0;
  String opcaoSelecionada = "";

  StatusPergunta statusPergunta = StatusPergunta.aguardando;

  void registraResposta(String e) {
    if (statusPergunta == StatusPergunta.aguardando) {
      setState(() {
        opcaoSelecionada = e;
        statusPergunta = StatusPergunta.respondida;
      });
    }
  }

  void proximaPergunta() {
    setState(() {
      if (perguntaAtual < perguntas.length - 1) {
        perguntaAtual += 1;
      }
      statusPergunta = StatusPergunta.aguardando;
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
          Divider(
            color: Colors.grey[300],
            height: 20,
            thickness: 2.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              perguntas[perguntaAtual].utterance,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Divider(
            color: Colors.grey[300],
            height: 20,
            thickness: 2.0,
          ),
          ...perguntas[perguntaAtual]
              .options
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    registraResposta(e);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 20.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(
                            color: statusPergunta == StatusPergunta.respondida
                                ? e == opcaoSelecionada
                                    ? e == perguntas[perguntaAtual].answer
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
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
              .toList(),
          SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              proximaPergunta();
            },
            child: Container(
              width: double.infinity,
              height: 60,
              alignment: Alignment.center,
              margin:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Colors.red[200],
                  border: Border.all(color: Colors.redAccent, width: 2),
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
                "Proxima pergunta",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
