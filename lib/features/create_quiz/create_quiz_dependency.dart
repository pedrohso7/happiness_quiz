import 'package:get_it/get_it.dart';

import '../../core/usecases/usecase.dart';
import 'data/datasources/create_quiz_remote_datasource.dart';
import 'data/repositories/create_quiz_repository.dart';
import 'domain/entities/question.dart';
import 'domain/repositories/create_quiz_repository_interface.dart';
import 'domain/usecases/get_questions.dart' as usecase;
import 'domain/usecases/get_questions.dart';
import 'presenter/bloc/create_quiz_bloc.dart';

Future<void> initCreateQuizDependencies(GetIt sl) async {
  // Data sources
  sl.registerLazySingleton<CreateQuizRemoteDataSourceInterface>(
    () => CreateQuizRemoteDataSource(
      client: sl(),
    ),
  );

  // Repositories
  sl.registerLazySingleton<CreateQuizRepositoryInterface>(
    () => CreateQuizRepository(
      remoteDatasource: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<UseCase<Future<List<Question>>, GetQuestionsParams>>(
    () => usecase.GetQuestions(repository: sl()),
  );

  // Bloc
  sl.registerLazySingleton(
    () => CreateQuizBloc(sl()),
  );
}
