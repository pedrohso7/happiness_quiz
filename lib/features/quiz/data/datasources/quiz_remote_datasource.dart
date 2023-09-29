import 'package:dio/dio.dart';

import '../../../../core/errors/remote_client_exception.dart';
import '../../../../core/platform/quiz_api_client.dart';
import '../../../../core/helpers/category_helper.dart';
import '../../domain/entities/question.dart';
import '../../domain/usecases/get_questions.dart';
import '../models/question_model.dart';

abstract class QuizRemoteDataSourceInterface {
  Future<List<Question>> getQuestions(GetQuestionsParams params);
}

class QuizRemoteDataSource implements QuizRemoteDataSourceInterface {
  final QuizApiClient client;
  QuizRemoteDataSource({required this.client});

  @override
  Future<List<Question>> getQuestions(GetQuestionsParams params) async {
    try {
      String? getDifficulty(QuestionDifficulty value) {
        if (value == QuestionDifficulty.easy) return 'easy';
        if (value == QuestionDifficulty.medium) return 'medium';
        if (value == QuestionDifficulty.hard) return 'hard';
        return null;
      }

      final String? difficulty = getDifficulty(params.difficulty);
      final queryParameters = <String, dynamic>{
        "amount": params.numberOfQuestions,
      };

      if (difficulty != null) {
        queryParameters["difficulty"] = difficulty;
      }

      if (params.category != 'Any category') {
        queryParameters["category"] =
            CategoryHelper.categoryToIdMap[params.category];
      }

      final Response response = await client.dio.get(
        '/',
        queryParameters: queryParameters,
      );
      final List<Question> questions = response.data['results']
          .map<Question>(
            (quiz) => QuestionModel.fromMap(
              quiz as Map<String, dynamic>,
            ),
          )
          .toList();
      return questions;
    } on DioException catch (e) {
      throw RemoteClientException(e.message!);
    } catch (e) {
      throw RemoteClientException('Erro ao buscar questionários respondidos');
    }
  }
}
