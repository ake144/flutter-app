import 'package:equatable/equatable.dart';


abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object?> get props => [];
}

class QuizStarted extends  QuizEvent{}

class AnswerSelected extends QuizEvent{
  final int score;
  final String selectedAnswer;
  const AnswerSelected({required this.score, required this.selectedAnswer});

  @override
  List<Object?> get props => [score, selectedAnswer];
}

class RestartQuiz extends QuizEvent{}