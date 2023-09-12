import '../../../../core/platform/quiz_api_client.dart';

abstract class AnswerQuizRemoteDataSourceInterface {}

class AnswerQuizRemoteDataSource
    implements AnswerQuizRemoteDataSourceInterface {
  final QuizApiClient client;
  AnswerQuizRemoteDataSource({required this.client});
}
