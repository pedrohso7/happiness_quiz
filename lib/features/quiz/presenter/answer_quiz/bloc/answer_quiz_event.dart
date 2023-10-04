part of 'answer_quiz_bloc.dart';

sealed class AnswerQuizEvent extends Equatable {
  const AnswerQuizEvent();

  @override
  List<Object> get props => [];
}

class SetInitialState extends AnswerQuizEvent {}

class ChooseAlternativeEvent extends AnswerQuizEvent {
  final String selectedAnswer;
  const ChooseAlternativeEvent({
    required this.selectedAnswer,
  });
}

class GoToNextQuestionEvent extends AnswerQuizEvent {}
