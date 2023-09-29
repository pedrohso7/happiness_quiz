import 'package:equatable/equatable.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/question.dart';
import '../repositories/quiz_repository_interface.dart';

class GetQuestions
    implements UseCase<Future<List<Question>>, GetQuestionsParams> {
  final QuizRepositoryInterface repository;
  GetQuestions({required this.repository});

  @override
  Future<List<Question>> call(GetQuestionsParams params) async {
    final IResult response = await repository.getQuestions(params);

    if (response.isError) {
      throw response.error!;
    }

    return response.result;
  }
}

class GetQuestionsParams extends Equatable {
  final QuestionDifficulty difficulty;
  final int numberOfQuestions;
  final String category;

  @override
  List get props => [difficulty, numberOfQuestions];

  const GetQuestionsParams(
      this.difficulty, this.numberOfQuestions, this.category);
}
