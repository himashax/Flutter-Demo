// ignore_for_file: prefer_const_constructors, deprecated_member_use, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_print, use_key_in_widget_constructors, unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
// never ever changes
  final _questions = const [
    // have an array of key value pairs in map
    {
      'questionText': 'What\'s your favourite color?',
      'answer': [
        {'text': 'Red', 'score': 10},
        {'text': 'Blue', 'score': 20},
        {'text': 'White', 'score': 30},
        {'text': 'Black', 'score': 30}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answer': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Bird', 'score': 20},
        {'text': 'Butterfly', 'score': 30},
        {'text': 'Cat', 'score': 30}
      ]
    },
    {
      'questionText': 'What\'s your favourite Name?',
      'answer': [
        {'text': 'Anne', 'score': 10},
        {'text': 'Jack', 'score': 20},
        {'text': 'John', 'score': 30},
        {'text': 'Anaya', 'score': 30}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
    
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });

    print(_questionIndex);
  }

  // returns a widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello World"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

  
  /* void main() {
    runApp(MyApp());
  } */

  /*     
  var dummy = ['Hello'];
  // can add another element cause the list(value of dummy) is not constant
  dummy.add('Max');
  print(dummy); 
  
  if the value is constant...
  var dummy = const ['Hello']; // only the value is constant
  dummy.add('Max'); // does not work here
  dummy = ['hi']; // can only create a new value to the dummy variable
  print(dummy);
  
  // both the variable and the value is constant
  const dummy = ['Hello'];

  */