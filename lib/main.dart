import 'package:flutter/material.dart';
import 'package:quiz_app/Quiz.dart';
import 'package:quiz_app/Result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyQuizApp(title: 'Quiz App'),
    );
  }
}

class MyQuizApp extends StatefulWidget {
  const MyQuizApp({super.key, required this.title});


  final String title;

  @override
  State<MyQuizApp> createState() => _MyQuizAppState();
}

class _MyQuizAppState extends State<MyQuizApp> {
  var question = [
    {
      "questionText": "What is your favorite food?",
      "answer": [
        {'text': 'lasagna', 'score': 10},
        {'text': 'Rice', 'score': 8},
        {'text': 'Chicken handi', 'score': 5},
        {'text': 'biryani', 'score': 10}
      ]
    },
    {
      "questionText": "What is your favorite color?",
      "answer": [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 20},
        {'text': 'Green', 'score': 8}
      ]
    },
    {
      "questionText": "Which is your favorite car?",
      "answer": [
        {'text': 'Hyundai city', 'score': 10},
        {'text': 'Mahindra Thar', 'score': 15},
        {'text': 'Toyota innova ', 'score': 20},
        {'text': 'BMW x5', 'score': 15}
      ]
    }
  ];

  var questionIndex = 0;
  var _totalScore=0;

  void _resetQuiz(){
    setState(() {
      questionIndex=0;
      _totalScore=0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: questionIndex < question.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              question: question,
              questionIndex: questionIndex)
          : Result(_totalScore,_resetQuiz),
    );
  }
}
