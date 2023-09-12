import 'package:get_it/get_it.dart';

import 'data/datasources/answer_quiz_remote_datasource.dart';
import 'data/repositories/answer_quiz_repository.dart';
import 'domain/repositories/answer_quiz_repository_interface.dart';
import 'presenter/bloc/answer_quiz_bloc.dart';

Future<void> initAnswerQuizDependencies(GetIt sl) async {
  // Data sources
  sl.registerLazySingleton<AnswerQuizRemoteDataSourceInterface>(
    () => AnswerQuizRemoteDataSource(
      client: sl(),
    ),
  );

  // Repositories
  sl.registerLazySingleton<AnswerQuizRepositoryInterface>(
    () => AnswerQuizRepository(
      remoteDatasource: sl(),
    ),
  );

  // Use cases

  // Bloc
  sl.registerLazySingleton(
    () => AnswerQuizBloc(),
  );
}
