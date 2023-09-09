part of 'create_quiz_bloc.dart';

sealed class CreateQuizState extends Equatable {
  const CreateQuizState();

  @override
  List<Object> get props => [];
}

final class CreateQuizInitial extends CreateQuizState {}

final class CreateQuizLoading extends CreateQuizState {}

final class CreateQuizError extends CreateQuizState {
  final String message;
  const CreateQuizError(this.message);
}

final class CreateQuizLoaded extends CreateQuizState {
  final List<Question> questions;
  const CreateQuizLoaded(this.questions);
}
