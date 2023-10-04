import '../../../../core/platform/quiz_api_client.dart';

abstract class HomeRemoteDataSourceInterface {}

class HomeRemoteDataSource implements HomeRemoteDataSourceInterface {
  final QuizApiClient client;
  HomeRemoteDataSource({required this.client});
}
