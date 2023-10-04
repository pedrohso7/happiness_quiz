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
  late AnswerQuizBloc bloc;
  @override
  void initState() {
    bloc = AnswerQuizBloc.get(context);
    bloc.add(SetInitialState());
    super.initState();
  }

  void _goBack() => context.pop();

  void _goToNextQuestion() async {
    await Future.delayed(
        const Duration(seconds: 3),
        () => bloc.add(
              GoToNextQuestionEvent(),
            ));
  }

  void _onPressAlternative(String alternative) =>
      bloc.add(ChooseAlternativeEvent(
        selectedAnswer: alternative,
        goToNextQuestion: _goToNextQuestion,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: 'Answer Quiz',
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
                currentQuestionCount: state.currentQuestionCount,
                selectedAlternative: state.selectedAlternative,
                questions: widget.questions,
                onPressAlternative: _onPressAlternative,
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
