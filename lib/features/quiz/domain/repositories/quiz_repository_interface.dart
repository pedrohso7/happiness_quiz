import '../../../../core/result/result.dart';
import '../entities/question.dart';
import '../usecases/get_questions.dart';

abstract class QuizRepositoryInterface {
  Future<IResult<List<Question>>> getQuestions(GetQuestionsParams params);
}
