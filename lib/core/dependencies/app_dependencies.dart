import 'dart:core';

import 'package:get_it/get_it.dart';
import 'package:happiness_quiz/core/platform/quiz_api_client.dart';
import 'package:happiness_quiz/features/home/home_dependency.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Infra
  sl.registerLazySingleton(() => QuizApiClient());

  // Features
  await initHomeDependencies(sl);
}
