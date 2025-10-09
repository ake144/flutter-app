import 'package:flutter_bloc/flutter_bloc.dart';
import 'quiz_event.dart';
import 'quiz_state.dart';



class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final List<Map<String, Object>> questions;
  QuizBloc(this.questions) : super(QuizState.initial()){
    on<QuizStarted>((event, emit){
      emit(QuizState.initial());
    });

    on<AnswerSelected>((event, emit){
      final currentQuestion = questions[state.questionIndex];
      final correctAnswer = currentQuestion['correctAnswer'] as String;
      int updatedScore = state.totalScore;

      if(event.selectedAnswer == correctAnswer){
        updatedScore += event.score;
      }
      final isLastQuestion = state.questionIndex == questions.length - 1;
    
      emit(state.copyWith(
        totalScore: updatedScore,
        questionIndex: isLastQuestion ? state.questionIndex : state.questionIndex + 1,
        isCompleted: isLastQuestion
      ));

      on<RestartQuiz>((event,emit){
        emit(QuizState.initial());
      });
    });
  


  }
}