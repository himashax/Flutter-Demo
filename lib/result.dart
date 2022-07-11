import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function() resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhase {
    var resultText = "You did it!";
    if (resultScore <= 8) {
      resultText = "Good";
    } else if (resultScore <= 20) {
      resultText = "Great";
    } else if (resultScore <= 70) {
      resultText = "Awesome";
    } else if (resultScore <= 120) {
      resultText = "Excellent";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhase,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz!'),
            onPressed: resetHandler,
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
