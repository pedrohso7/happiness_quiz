part of 'create_quiz_bloc.dart';

sealed class CreateQuizEvent extends Equatable {
  const CreateQuizEvent();

  @override
  List<Object> get props => [];
}

class GetQuestions extends CreateQuizEvent {
  const GetQuestions();
}
