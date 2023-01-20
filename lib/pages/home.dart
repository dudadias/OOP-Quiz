import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/pages/result.dart';
import 'package:quiz/repository/questions.dart';
import 'package:quiz/widgets/button.dart';
import 'package:quiz/widgets/option.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

enum StatusPergunta { aguardando, respondida }

enum StatusQuiz { ocorrendo, terminou, resultados }

class _HomeState extends State<Home> {
  final List<Question> perguntas = QuestionsRepository().createQuestions(5);
  int perguntaAtual = 0;
  String opcaoSelecionada = "";

  StatusPergunta statusPergunta = StatusPergunta.aguardando;
  StatusQuiz statusQuiz = StatusQuiz.ocorrendo;

  int acertos = 0;
  int erros = 0;

  void registraResposta(String e) {
    if (statusPergunta == StatusPergunta.aguardando) {
      setState(() {
        opcaoSelecionada = e;
        statusPergunta = StatusPergunta.respondida;
      });
    }
    if (e == perguntas[perguntaAtual].answer) {
      acertos++;
    } else {
      erros++;
    }
  }

  void proximaPergunta() {
    if (statusQuiz == StatusQuiz.terminou) {
      setState(() {
        statusQuiz = StatusQuiz.resultados;
      });
    } else {
      setState(() {
        statusPergunta = StatusPergunta.aguardando;
        if (perguntaAtual < perguntas.length - 1) {
          perguntaAtual += 1;
        }

        if (perguntaAtual == perguntas.length - 1) {
          statusQuiz = StatusQuiz.terminou;
        }
      });
    }
  }

  void novoQuiz() {
    setState(() {
      perguntaAtual = 0;
      opcaoSelecionada = "";

      statusPergunta = StatusPergunta.aguardando;
      statusQuiz = StatusQuiz.ocorrendo;

      acertos = 0;
      erros = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return statusQuiz == StatusQuiz.resultados
        ? Result(acertos: acertos, novo: novoQuiz)
        : Center(
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                    .map((e) => Option(
                          e: e,
                          isResondida:
                              statusPergunta == StatusPergunta.respondida,
                          isSelecionada: e == opcaoSelecionada,
                          isCorreta: e == perguntas[perguntaAtual].answer,
                          registraResposta: registraResposta,
                        ))
                    .toList(),
                const SizedBox(height: 50),
                statusPergunta == StatusPergunta.respondida
                    ? Button(
                        label: statusQuiz == StatusQuiz.terminou
                            ? "See Results"
                            : "Next",
                        next: proximaPergunta,
                      )
                    : GestureDetector(
                        onTap: () {
                          null;
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
                              color: Colors.transparent,
                              border: Border.all(
                                  color: Colors.transparent, width: 2),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.transparent,
                                  offset: Offset(
                                    0,
                                    2,
                                  ),
                                  blurRadius: 4.0,
                                ),
                              ]),
                          child: const Text(
                            "Next",
                            style: TextStyle(color: Colors.transparent),
                          ),
                        ),
                      )
              ],
            ),
          );
  }
}
