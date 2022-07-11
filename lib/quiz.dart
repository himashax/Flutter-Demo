import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function(int) answerQuestion;

  Quiz(
      {required this.questions,
      required this.questionIndex,
      required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //  Text(questions[_questionIndex]),
      // used question widget
      Question(
        // gotta access the key from the array
        questions[questionIndex]['questionText'] as String,
      ),
      // Change the nested list into (children)
      ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
          .map((answer) {
        // creates a method answerQuestion -> function body
        // answerQuestion() -> function
        // need to pass only the function not the return value by executing it
        return Answer(() => answerQuestion(answer['score'] as int),
            answer['text'] as String);
      }).toList()
    ]);
  }
}
