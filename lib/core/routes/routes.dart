import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presenter/home_presenter.dart';
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
      ],
    );
  }
}
