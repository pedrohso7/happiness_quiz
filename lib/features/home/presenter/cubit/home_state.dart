part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {
  HomeInitial();
}

final class HomeLoading extends HomeState {
  HomeLoading();
}

final class HomeLoaded extends HomeState {
  final List<AnsweredQuiz> quizList;

  HomeLoaded(this.quizList);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HomeLoaded && o.quizList == quizList;
  }

  @override
  int get hashCode => quizList.hashCode;
}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HomeError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
