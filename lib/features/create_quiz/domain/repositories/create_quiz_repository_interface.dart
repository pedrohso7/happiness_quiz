import '../../../../core/result/result.dart';
import '../entities/question.dart';

abstract class CreateQuizRepositoryInterface {
  Future<IResult<List<Question>>> getQuestions();
}
