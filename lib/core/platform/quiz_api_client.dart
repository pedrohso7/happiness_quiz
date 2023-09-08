import 'package:dio/dio.dart';

abstract class QuizApiClientInterface {
  late final Dio dio;
}

class QuizApiClient implements QuizApiClientInterface {
  @override
  late final Dio dio;
  QuizApiClient() {
    dio = Dio(BaseOptions(baseUrl: "https://opentdb.com/api.php"));
  }
}
