import 'package:dio/dio.dart';

import '../../../../core/errors/remote_client_exception.dart';
import '../../../../core/platform/quiz_api_client.dart';
import '../../domain/entities/question.dart';
import '../models/question_model.dart';

abstract class HomeRemoteDataSourceInterface {
  Future<List<Question>> getQuestions();
}

class HomeRemoteDataSource implements HomeRemoteDataSourceInterface {
  final QuizApiClient client;
  HomeRemoteDataSource({required this.client});

  @override
  Future<List<Question>> getQuestions() async {
    try {
      final Response response = await client.dio.get(
        '/',
        queryParameters: {
          "amount": 10,
        },
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
