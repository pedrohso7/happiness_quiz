import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/errors/remote_client_exception.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/question.dart';
import '../../../domain/usecases/get_questions.dart';

part 'create_quiz_event.dart';
part 'create_quiz_state.dart';

class CreateQuizBloc extends Bloc<CreateQuizEvent, CreateQuizState> {
  static CreateQuizBloc get(context) => BlocProvider.of(context);
  final UseCase<Future<List<Question>>, GetQuestionsParams> _getQuestions;
  CreateQuizBloc(this._getQuestions)
      : super(
          const CreateQuizDefault(
            numberOfQuestions: 10,
            difficulty: QuestionDifficulty.random,
          ),
        ) {
    on<CreateQuizEvent>((event, emit) async {
      if (event is SetDifficultyEvent) {
        await _handleSetDifficultyEvent(
            event, emit, state as CreateQuizDefault);
      }
      if (event is SetNumberOfQuestionsEvent) {
        await _handleSetNumberOfQuestionsEvent(
            event, emit, state as CreateQuizDefault);
      }
      if (event is GetQuestionsEvent) {
        await _handleGetQuestionsEvent(event, emit);
      }
    });
  }

  Future<void> _handleSetDifficultyEvent(SetDifficultyEvent event,
      Emitter<CreateQuizState> emit, CreateQuizDefault state) async {
    emit(CreateQuizDefault(
      numberOfQuestions: state.numberOfQuestions,
      difficulty: event.difficulty,
    ));
  }

  Future<void> _handleSetNumberOfQuestionsEvent(SetNumberOfQuestionsEvent event,
      Emitter<CreateQuizState> emit, CreateQuizDefault state) async {
    emit(CreateQuizDefault(
      numberOfQuestions: event.numberOfQuestions,
      difficulty: state.difficulty,
    ));
  }

  Future<void> _handleGetQuestionsEvent(
      GetQuestionsEvent event, Emitter<CreateQuizState> emit) async {
    try {
      emit(CreateQuizLoading());
      final response = await _getQuestions(GetQuestionsParams(
        event.difficulty,
        event.numberOfQuestions,
        event.category,
      ));
      event.goToAnswerQuizPage(response);
    } on RemoteClientException catch (e) {
      emit(CreateQuizError(e.message));
    }
  }
}
