import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;
  Result(this.totalScore,this.resetQuiz);

  String get resultPhrase{
    String resultText;
    if(totalScore<=15){
      resultText = "You are innocent and awesome";
    }else if(totalScore <= 25){
      resultText = "This is pretty likeable";
    }else if(totalScore <=30){
      resultText = "You are Good!!";
    }else{
      resultText  = "Fabulous!!!";
    }
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
          Text(resultPhrase),
          FilledButton(onPressed: resetQuiz, child: Text("Reset Quiz"))
        ],
      ),
    );
  }
}
