import 'package:get_it/get_it.dart';

import 'data/datasources/home_remote_datasource.dart';
import 'data/repositories/home_repository.dart';
import 'domain/repositories/home_repository_interface.dart';

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

  // Bloc
}
