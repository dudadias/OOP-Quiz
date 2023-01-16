import '../models/question.dart';

List<Map> _qlist = [
  {
    "utterance": "Information Hiding can also be termed as:",
    "answer": "Encapsulation",
    "options": ["Inheritance", "Data hidding", "Polymorphism"]
  },
  {
    "utterance":
        "The process by which one object can acquire the properties of another object:",
    "answer": "Inheritance",
    "options": ["Encapsulation", "Polymorphism", "Overloading"]
  },
  {
    "utterance":
        "The method with the same name or different return type and difference in the parameters either in number or type is known as:",
    "answer": "Compile time overloading",
    "options": [
      "Function overloading",
      "Compile time overwriting",
      "Memory address of class"
    ]
  },
  {
    "utterance":
        "Which these modifiers allows access the class, packages and inheritance?",
    "answer": "Protected",
    "options": ["Public", "Private", "Default"]
  },
  {
    "utterance": "Pick the term that relates to polymorphism:",
    "answer": "Dynamic binding",
    "options": ["Dynamic allocation", "Static typing", "Static allocation"]
  },
];

class QuestionsRepository {
  List<Question> createQuestions(int qtde) {
    List<Question> questions = [];

    _qlist.shuffle();

    for (int i = 0; (i < qtde) && (i < _qlist.length); i++) {
      var selected = _qlist[i];

      var question = Question(
          utterance: selected["utterance"],
          answer: selected["answer"],
          options: [...selected["options"], selected["answer"]]..shuffle());

      questions.add(question);
    }

    return questions;
  }
}
