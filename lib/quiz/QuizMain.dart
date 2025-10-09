import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/quiz/bloc/quiz_bloc.dart';
import 'package:my_flutter_app/quiz/bloc/quiz_event.dart';
import 'package:my_flutter_app/quiz/bloc/quiz_state.dart';
import 'package:my_flutter_app/quiz/quiz.dart';
import 'package:my_flutter_app/quiz/result.dart';

class Quizmain extends StatefulWidget {
  const Quizmain({super.key});

  @override
  State<Quizmain> createState() => _QuizmainState();


}

class _QuizmainState extends State<Quizmain> {
  
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
      'correctAnswer': 'Black',
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
      'correctAnswer': 'Rabbit',
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
      'correctAnswer': 'Max',
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  // void _restQuiz(){
  //   setState(() {
  //     _questionIndex = 0;
  //     _totalScore = 0;
  //   });
  // }

  // void _answerQuestion(int score, String answerText){
  //   if( _questions[_questionIndex]['correctAnswer'] == answerText ){
  //   _totalScore += score;
  //   }
  //   setState(() {
  //     _questionIndex = _questionIndex + 1;
  //   });
  //   print(_questionIndex);
  //   if(_questionIndex < _questions.length){
  //     print('We have more questions!');
  //   } else {
  //     print('No more questions!');
  //   }
  // }





  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>QuizBloc(_questions),
      child: Scaffold(
        body: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            if (state.isCompleted) {
              return Result(state.totalScore, () {
                context.read<QuizBloc>().add(RestartQuiz());
              });
            }
            return Quiz(
              questions: _questions,
              answerQuestion: (score, answerText) {
                context.read<QuizBloc>().add(AnswerSelected(score: score, selectedAnswer: answerText));
              },
              questionIndex: state.questionIndex,
            );
          },
        ),
      ),
    );
  }
}
         

           

          
