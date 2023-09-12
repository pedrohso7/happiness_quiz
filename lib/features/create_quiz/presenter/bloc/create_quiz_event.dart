part of 'create_quiz_bloc.dart';

sealed class CreateQuizEvent extends Equatable {
  const CreateQuizEvent();

  @override
  List<Object> get props => [];
}

class SetDifficultyEvent extends CreateQuizEvent {
  final QuestionDifficulty difficulty;
  const SetDifficultyEvent({required this.difficulty});
}

class SetNumberOfQuestionsEvent extends CreateQuizEvent {
  final int numberOfQuestions;
  const SetNumberOfQuestionsEvent({required this.numberOfQuestions});
}

class GetQuestionsEvent extends CreateQuizEvent {
  final QuestionDifficulty difficulty;
  final int numberOfQuestions;
  final BuildContext context; //To redirect
  const GetQuestionsEvent(
      this.difficulty, this.numberOfQuestions, this.context);
}
