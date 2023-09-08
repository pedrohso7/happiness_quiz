import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happiness_quiz/core/errors/remote_client_exception.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/question.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static HomeBloc get(context) => BlocProvider.of(context);

  final UseCase<Future<List<Question>>, NoParams> _getQuestions;
  HomeBloc(this._getQuestions) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetQuestions) {
        await getQuestionsEventHandler(emit);
      }
    });
  }

  Future getQuestionsEventHandler(Emitter<HomeState> emit) async {
    try {
      emit(HomeLoading());
      final List<Question> questions = await _getQuestions(NoParams());
      emit(HomeLoaded(questions));
    } on RemoteClientException catch (e) {
      emit(HomeError(e.message));
    }
  }
}
