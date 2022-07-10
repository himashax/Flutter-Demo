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
        {'text': 'Red', 'Score': 10},
        {'text': 'Blue', 'Score': 20},
        {'text': 'White', 'Score': 30},
        {'text': 'Black', 'Score': 30}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answer': [
        {'text': 'Rabbit', 'Score': 10},
        {'text': 'Bird', 'Score': 20},
        {'text': 'Butterfly', 'Score': 30},
        {'text': 'Cat', 'Score': 30}
      ]
    },
    {
      'questionText': 'What\'s your favourite Name?',
      'answer': [
        {'text': 'Anne', 'Score': 10},
        {'text': 'Jack', 'Score': 20},
        {'text': 'John', 'Score': 30},
        {'text': 'Anaya', 'Score': 30}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

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
            : Result(_totalScore),
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