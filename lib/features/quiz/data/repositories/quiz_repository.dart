import '../../../../core/errors/remote_client_exception.dart';
import '../../../../core/result/result.dart';
import '../../domain/entities/question.dart';
import '../../domain/repositories/quiz_repository_interface.dart';
import '../../domain/usecases/get_questions.dart';
import '../datasources/quiz_remote_datasource.dart';

class QuizRepository implements QuizRepositoryInterface {
  final QuizRemoteDataSourceInterface remoteDatasource;

  QuizRepository({
    required this.remoteDatasource,
  });

  @override
  Future<IResult<List<Question>>> getQuestions(
      GetQuestionsParams params) async {
    try {
      return SuccessResult(await remoteDatasource.getQuestions(params));
    } on RemoteClientException catch (e) {
      return ErrorResult(e);
    }
  }
}
