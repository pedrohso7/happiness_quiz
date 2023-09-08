part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);
}

final class HomeLoaded extends HomeState {
  final List<Question> questions;
  const HomeLoaded(this.questions);
}
