import 'package:get_it/get_it.dart';

import '../../core/usecases/usecase.dart';
import 'data/datasources/home_remote_datasource.dart';
import 'data/repositories/home_repository.dart';
import 'domain/entities/question.dart';
import 'domain/repositories/home_repository_interface.dart';
import 'domain/usecases/get_questions.dart' as usecase;
import 'presenter/bloc/home_bloc.dart';

Future<void> initHomeDependencies(GetIt sl) async {
  // Data sources
  sl.registerLazySingleton<HomeRemoteDataSourceInterface>(
    () => HomeRemoteDataSource(
      client: sl(),
    ),
  );

  // Repositories
  sl.registerLazySingleton<HomeRepositoryInterface>(
    () => HomeRepository(
      remoteDatasource: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<UseCase<Future<List<Question>>, NoParams>>(
    () => usecase.GetQuestions(repository: sl()),
  );

  // Bloc
  sl.registerLazySingleton(
    () => HomeBloc(sl()),
  );
}
