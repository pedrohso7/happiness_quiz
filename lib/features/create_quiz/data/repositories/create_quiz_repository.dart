import '../../../../core/errors/local_storage_exception.dart';
import '../../../../core/result/result.dart';
import '../../domain/entities/question.dart';
import '../../domain/repositories/create_quiz_repository_interface.dart';
import '../datasources/create_quiz_remote_datasource.dart';

class CreateQuizRepository implements CreateQuizRepositoryInterface {
  final CreateQuizRemoteDataSourceInterface remoteDatasource;

  CreateQuizRepository({
    required this.remoteDatasource,
  });

  @override
  Future<IResult<List<Question>>> getQuestions() async {
    try {
      return SuccessResult(await remoteDatasource.getQuestions());
    } on LocalStorageException catch (e) {
      return ErrorResult(e);
    }
  }
}
