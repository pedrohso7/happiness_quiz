part of 'answer_quiz_bloc.dart';

sealed class AnswerQuizState extends Equatable {
  const AnswerQuizState();

  @override
  List<Object> get props => [];
}

final class AnswerQuizInitial extends AnswerQuizState {}

final class AnswerQuizError extends AnswerQuizState {
  final String message;
  const AnswerQuizError(this.message);
}

final class AnswerQuizDefault extends AnswerQuizState {
  final int currentQuestionCount;
  final String selectedAlternative;
  const AnswerQuizDefault(
    this.currentQuestionCount,
    this.selectedAlternative,
  );
}
