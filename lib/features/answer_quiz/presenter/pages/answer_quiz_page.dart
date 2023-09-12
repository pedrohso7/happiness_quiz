import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/filled_container.dart';
import '../../domain/entities/question.dart';
import '../bloc/answer_quiz_bloc.dart';

class AnswerQuizPage extends StatelessWidget {
  const AnswerQuizPage({
    Key? key,
    required this.questions,
  }) : super(key: key);

  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    final AnswerQuizBloc createQuizBloc = AnswerQuizBloc.get(context);

    return FilledContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.s16,
          horizontal: AppSizes.s24,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.emoji_objects,
                      color: AppColors.yellow,
                    ),
                    const SizedBox(width: AppSizes.s4),
                    Text(
                      'Pergunta 1/10',
                      style: AppTextStyles.defaultYellowText,
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.s24),
                Text(
                  'question',
                  style: AppTextStyles.subTitle,
                ),
                const SizedBox(height: AppSizes.s32),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(bottom: AppFontSizes.s24),
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultButton(
                    height: AppSizes.s80,
                    width: AppSizes.s80,
                    borderRadius: AppSizes.s80,
                    onPressed: () => {},
                    child: Icon(
                      Icons.arrow_circle_right,
                      color: AppColors.white,
                      size: AppSizes.s40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
