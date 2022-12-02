
import 'package:flutter/material.dart';

import 'Answer.dart';
import 'Questions.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String,Object>> question;
  final int questionIndex;

  Quiz({required this.answerQuestion,required this.question,required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questions(question[questionIndex]['questionText'] as String),
        ...(question[questionIndex]['answer'] as List<Map<String,Object>>)
            .map((answer) {
          return Answer(()=> answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
