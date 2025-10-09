

import 'package:equatable/equatable.dart';

class QuizState extends Equatable {
  final int questionIndex;
  final int totalScore;
  final bool isCompleted;

  const QuizState({
    required this.questionIndex,
    required this.totalScore,
    required this.isCompleted
  });

  factory QuizState.initial(){
    return const QuizState(
      questionIndex: 0,
      totalScore: 0,
      isCompleted: false
    );
  }

  QuizState copyWith({
    int? questionIndex,
    int? totalScore,
    bool? isCompleted
  }){
    return QuizState(
      questionIndex: questionIndex ?? this.questionIndex,
      totalScore: totalScore ?? this.totalScore,
      isCompleted: isCompleted ?? this.isCompleted
    );
  }

  @override
  List<Object?> get props => [questionIndex, totalScore, isCompleted];
}