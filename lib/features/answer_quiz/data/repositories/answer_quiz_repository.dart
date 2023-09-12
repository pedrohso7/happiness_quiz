import '../../domain/repositories/answer_quiz_repository_interface.dart';
import '../datasources/answer_quiz_remote_datasource.dart';

class AnswerQuizRepository implements AnswerQuizRepositoryInterface {
  final AnswerQuizRemoteDataSourceInterface remoteDatasource;

  AnswerQuizRepository({
    required this.remoteDatasource,
  });
}
