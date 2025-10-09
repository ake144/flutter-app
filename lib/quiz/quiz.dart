import 'package:flutter/material.dart';

class Quiz extends StatelessWidget{
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

Quiz({
    required this.questions,
    required this.questionIndex,
    required this.answerQuestion,
    Key? key
}) : super(key: key);

@override
Widget build(BuildContext context){
  return Column(
    children: [
      Text(
        questions[questionIndex]['questionText'] as String,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 28),
      ),
      const SizedBox(height: 20),
      ...((questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) =>
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  onPressed: () => answerQuestion(answer['score'] as int, answer['text'] as String),
                  child: Text(
                    answer['text'] as String,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              )
            ).toList(growable: true))
    ],
  );
}
}