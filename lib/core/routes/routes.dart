import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presenter/home_presenter.dart';
import '../../features/quiz/domain/entities/question.dart';
import '../../features/quiz/presenter/answer_quiz/answer_quiz_presenter.dart';
import '../../features/quiz/presenter/create_quiz/create_quiz_presenter.dart';
import '../constants/routes.dart';

class AppRoutes {
  AppRoutes._();

  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: AppRoutesPath.home,
      routes: <RouteBase>[
        GoRoute(
          name: AppRoutesPath.home,
          path: AppRoutesPath.home,
          builder: (BuildContext context, GoRouterState state) {
            return const HomePresenter();
          },
        ),
        GoRoute(
          name: AppRoutesPath.createQuiz,
          path: AppRoutesPath.createQuiz,
          builder: (BuildContext context, GoRouterState state) {
            return CreateQuizPresenter(
                category: state.pathParameters['category']!);
          },
        ),
        GoRoute(
          name: AppRoutesPath.answerQuiz,
          path: AppRoutesPath.answerQuiz,
          builder: (BuildContext context, GoRouterState state) {
            List<Question> questions = state.extra as List<Question>;
            return AnswerQuizPresenter(questions: questions);
          },
        ),
      ],
    );
  }
}
