import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/widgets/default_appbar.dart';
import '../../domain/entities/question.dart';
import 'bloc/answer_quiz_bloc.dart';
import 'pages/answer_quiz_page.dart';

class AnswerQuizPresenter extends StatefulWidget {
  final List<Question> questions;
  const AnswerQuizPresenter({super.key, required this.questions});

  @override
  State<AnswerQuizPresenter> createState() => _AnswerQuizPresenter();
}

class _AnswerQuizPresenter extends State<AnswerQuizPresenter> {
  late AnswerQuizBloc createQuizBloc;
  @override
  void initState() {
    createQuizBloc = AnswerQuizBloc.get(context);
    super.initState();
  }

  void _goBack() => context.pop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: 'New Quiz',
        onPressBackButton: _goBack,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.s16,
          horizontal: AppSizes.s24,
        ),
        child: BlocBuilder<AnswerQuizBloc, AnswerQuizState>(
          builder: (context, state) {
            if (state is AnswerQuizDefault) {
              return AnswerQuizPage(
                questions: widget.questions,
              );
            }
            if (state is AnswerQuizLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AnswerQuizError) {
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
