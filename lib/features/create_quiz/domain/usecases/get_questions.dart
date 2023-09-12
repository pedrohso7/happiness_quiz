import 'package:equatable/equatable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/question.dart';
import '../repositories/create_quiz_repository_interface.dart';

class GetQuestions
    implements UseCase<Future<List<Question>>, GetQuestionsParams> {
  final CreateQuizRepositoryInterface repository;
  GetQuestions({required this.repository});

  @override
  Future<List<Question>> call(GetQuestionsParams params) async {
    final IResult response = await repository.getQuestions();

    if (response.isError) {
      throw response.error!;
    }

    return response.result;
  }
}

class GetQuestionsParams extends Equatable {
  final QuestionDifficulty difficulty;
  final int numberOfQuestions;

  @override
  List get props => [difficulty, numberOfQuestions];

  const GetQuestionsParams(this.difficulty, this.numberOfQuestions);
}
