import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'answer_quiz_event.dart';
part 'answer_quiz_state.dart';

class AnswerQuizBloc extends Bloc<AnswerQuizEvent, AnswerQuizState> {
  static AnswerQuizBloc get(context) => BlocProvider.of(context);
  AnswerQuizBloc()
      : super(
          AnswerQuizDefault(),
        ) {
    on<AnswerQuizEvent>((event, emit) async {});
  }
}
