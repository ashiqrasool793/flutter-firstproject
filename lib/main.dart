import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

//Main function Entry point for a Dart App
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': "What's your favourite color?",
      'answers': [
        {"text": "Black", "score": 10},
        {"text": "Blue", "score": 20},
        {"text": "White", "score": 30},
        {"text": "Green", "score": 40}
      ]
    },
    {
      'questionText': "What's your favourite animal?",
      'answers': [
        {"text": "Dog", "score": 10},
        {"text": "Cat", "score": 20},
        {"text": "Giraffe", "score": 30},
        {"text": "Lion", "score": 40}
      ]
    },
    {
      'questionText': "What's your favourite instructor?",
      'answers': [
        {"text": "Ashiq", "score": 10},
        {"text": "Max", "score": 20},
        {"text": "Mark", "score": 30},
        {"text": "Alan", "score": 40}
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
        _totalScore += score;
      });
      print('Answer 1 Chosen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My First App"),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(
                  finalScore: _totalScore,
                  resetQuiz: _resetQuiz,
                )),
    );
  }
}
