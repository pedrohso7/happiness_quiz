import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/dependencies/app_dependencies.dart' as dep;
import 'core/routes/routes.dart';
import 'features/quiz/presenter/create_quiz/bloc/create_quiz_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => dep.sl<CreateQuizBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: AppRoutes.createRouter(),
      ),
    );
  }
}
