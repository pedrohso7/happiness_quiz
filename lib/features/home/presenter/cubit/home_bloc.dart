import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/remote_client_exception.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/answered_quiz.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final UseCase<Future<List<AnsweredQuiz>>, NoParams> _getAnsweredQuizList;
  HomeCubit(this._getAnsweredQuizList) : super(HomeInitial());

  void changeState() {
    emit(HomeInitial());
  }

  Future<void> getAnsweredQuizList(String cityName) async {
    try {
      emit(HomeLoading());
      final List<AnsweredQuiz> answeredQuizList =
          await _getAnsweredQuizList(NoParams());
      emit(HomeLoaded(answeredQuizList));
    } on RemoteClientException catch (e) {
      emit(HomeError(e.message));
    }
  }
}
