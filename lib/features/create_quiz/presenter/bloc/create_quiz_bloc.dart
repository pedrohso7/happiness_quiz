import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happiness_quiz/core/errors/remote_client_exception.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/question.dart';

part 'create_quiz_event.dart';
part 'create_quiz_state.dart';

class CreateQuizBloc extends Bloc<CreateQuizEvent, CreateQuizState> {
  static CreateQuizBloc get(context) => BlocProvider.of(context);

  final UseCase<Future<List<Question>>, NoParams> _getQuestions;
  CreateQuizBloc(this._getQuestions) : super(CreateQuizInitial()) {
    on<CreateQuizEvent>((event, emit) async {
      if (event is GetQuestions) {
        await getQuestionsEventHandler(emit);
      }
    });
  }

  Future getQuestionsEventHandler(Emitter<CreateQuizState> emit) async {
    try {
      emit(CreateQuizLoading());
      final List<Question> questions = await _getQuestions(NoParams());
      emit(CreateQuizLoaded(questions));
    } on RemoteClientException catch (e) {
      emit(CreateQuizError(e.message));
    }
  }
}
