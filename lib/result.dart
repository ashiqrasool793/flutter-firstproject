import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final Function resetQuiz;

  Result({this.finalScore, this.resetQuiz});

  String get resultPhrase {
    var resultText;
    if (finalScore <= 30) {
      resultText = "You Failed";
    } else if (finalScore <= 40) {
      resultText = "Average";
    } else {
      resultText = "PowerLa";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        FlatButton(
          child: Text("Restart Quiz"),
          textColor: Colors.blue,
          onPressed: resetQuiz,
        ),
      ],
    );
  }
}
