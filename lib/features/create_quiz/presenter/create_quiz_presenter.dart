import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/constants/text_style.dart';
import '../../../core/widgets/default_appbar.dart';
import 'bloc/create_quiz_bloc.dart';
import 'pages/create_quiz_page.dart';

class CreateQuizPresenter extends StatefulWidget {
  const CreateQuizPresenter({super.key});

  @override
  State<CreateQuizPresenter> createState() => _CreateQuizPresenter();
}

class _CreateQuizPresenter extends State<CreateQuizPresenter> {
  late CreateQuizBloc createQuizBloc;
  @override
  void initState() {
    createQuizBloc = CreateQuizBloc.get(context);
    createQuizBloc.add(const GetQuestions());
    super.initState();
  }

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
        child: BlocBuilder<CreateQuizBloc, CreateQuizState>(
          builder: (context, state) {
            if (state is CreateQuizLoaded) {
              return CreateQuizPage(questions: state.questions);
            }
            if (state is CreateQuizLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CreateQuizError) {
              return Center(
                child: Text(
                  state.message,
                  style: AppTextStyles.subTitle,
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
