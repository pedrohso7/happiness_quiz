import '../../../../core/result/result.dart';
import '../entities/question.dart';

abstract class HomeRepositoryInterface {
  Future<IResult<List<Question>>> getQuestions();
}
