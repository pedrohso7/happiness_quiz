part of 'answer_quiz_bloc.dart';

sealed class AnswerQuizEvent extends Equatable {
  const AnswerQuizEvent();

  @override
  List<Object> get props => [];
}

class SetInitialState extends AnswerQuizEvent {}

class ChooseAlternativeEvent extends AnswerQuizEvent {
  final String selectedAnswer;
  final VoidCallback goToNextQuestion;
  const ChooseAlternativeEvent({
    required this.selectedAnswer,
    required this.goToNextQuestion,
  });
}

class GoToNextQuestionEvent extends AnswerQuizEvent {}
