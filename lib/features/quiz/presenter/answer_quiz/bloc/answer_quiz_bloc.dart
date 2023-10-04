import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'answer_quiz_event.dart';
part 'answer_quiz_state.dart';

class AnswerQuizBloc extends Bloc<AnswerQuizEvent, AnswerQuizState> {
  static AnswerQuizBloc get(context) => BlocProvider.of(context);
  AnswerQuizBloc()
      : super(
          AnswerQuizInitial(),
        ) {
    on<AnswerQuizEvent>((event, emit) async {
      if (event is ChooseAlternativeEvent) {
        await _handleChooseAlternativeEvent(
            event, emit, state as AnswerQuizDefault);
      }
      if (event is SetInitialState) {
        await _handleSetInitialStateEvent(emit);
      }
      if (event is GoToNextQuestionEvent) {
        await _handleGoToNextQuestionEvent(emit, state as AnswerQuizDefault);
      }
    });
  }

  Future<void> _handleSetInitialStateEvent(
      Emitter<AnswerQuizState> emit) async {
    emit(const AnswerQuizDefault(
      1,
      '',
    ));
  }

  Future<void> _handleChooseAlternativeEvent(ChooseAlternativeEvent event,
      Emitter<AnswerQuizState> emit, AnswerQuizDefault state) async {
    emit(AnswerQuizDefault(
      state.currentQuestionCount,
      event.selectedAnswer,
    ));
  }

  Future<void> _handleGoToNextQuestionEvent(
      Emitter<AnswerQuizState> emit, AnswerQuizDefault state) async {
    emit(AnswerQuizDefault(
      state.currentQuestionCount + 1,
      '',
    ));
  }
}
