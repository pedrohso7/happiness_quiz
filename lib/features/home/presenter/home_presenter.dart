import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happiness_quiz/features/home/presenter/pages/home_page.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/widgets/default_appbar.dart';
import 'bloc/home_bloc.dart';

class HomePresenter extends StatelessWidget {
  const HomePresenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(withBackButton: false),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.s16,
          horizontal: AppSizes.s24,
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) return const CircularProgressIndicator();
            if (state is HomeError) return Text(state.message);
            if (state is HomeLoaded)
              return HomePage(questions: state.questions);
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
