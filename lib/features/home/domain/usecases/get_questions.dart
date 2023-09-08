import '../../../../core/result/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/answered_quiz.dart';
import '../repositories/home_repository_interface.dart';

class GetQuestions implements UseCase<Future<List<AnsweredQuiz>>, NoParams> {
  final HomeRepositoryInterface repository;
  GetQuestions({required this.repository});

  @override
  Future<List<AnsweredQuiz>> call(NoParams params) async {
    final IResult response = await repository.getQuestions();

    if (response.isError) {
      throw response.error!;
    }

    return response.result;
  }
}
