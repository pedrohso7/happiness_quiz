part of 'create_quiz_bloc.dart';

sealed class CreateQuizState extends Equatable {
  const CreateQuizState();

  @override
  List<Object> get props => [];
}

final class CreateQuizLoading extends CreateQuizState {}

final class CreateQuizError extends CreateQuizState {
  final String message;
  const CreateQuizError(this.message);
}

final class CreateQuizDefault extends CreateQuizState {
  final int numberOfQuestions;
  final QuestionDifficulty difficulty;
  const CreateQuizDefault({
    required this.numberOfQuestions,
    required this.difficulty,
  });

  @override
  List<Object> get props => [numberOfQuestions, difficulty];
}
