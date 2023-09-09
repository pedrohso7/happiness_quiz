import '../../../../core/result/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/question.dart';
import '../repositories/create_quiz_repository_interface.dart';

class GetQuestions implements UseCase<Future<List<Question>>, NoParams> {
  final CreateQuizRepositoryInterface repository;
  GetQuestions({required this.repository});

  @override
  Future<List<Question>> call(NoParams params) async {
    final IResult response = await repository.getQuestions();

    if (response.isError) {
      throw response.error!;
    }

    return response.result;
  }
}
