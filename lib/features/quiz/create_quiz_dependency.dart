import 'package:get_it/get_it.dart';

import '../../core/usecases/usecase.dart';
import 'data/datasources/quiz_remote_datasource.dart';
import 'data/repositories/quiz_repository.dart';
import 'domain/entities/question.dart';
import 'domain/repositories/quiz_repository_interface.dart';
import 'domain/usecases/get_questions.dart';
import 'presenter/create_quiz/bloc/create_quiz_bloc.dart';

Future<void> initQuizDependencies(GetIt sl) async {
  // Data sources
  sl.registerLazySingleton<QuizRemoteDataSourceInterface>(
    () => QuizRemoteDataSource(
      client: sl(),
    ),
  );

  // Repositories
  sl.registerLazySingleton<QuizRepositoryInterface>(
    () => QuizRepository(
      remoteDatasource: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<UseCase<Future<List<Question>>, GetQuestionsParams>>(
    () => GetQuestions(repository: sl()),
  );

  // Bloc
  sl.registerLazySingleton(
    () => CreateQuizBloc(sl()),
  );
}
