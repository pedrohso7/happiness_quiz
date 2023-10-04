import 'package:flutter/material.dart';
import 'package:happiness_quiz/core/extensions/sized_box_extension.dart';
import 'package:happiness_quiz/core/widgets/filled_container.dart';
import 'package:happiness_quiz/features/quiz/presenter/answer_quiz/widgets/question_card.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_style.dart';
import '../../../domain/entities/question.dart';

class AnswerQuizPage extends StatelessWidget {
  final List<Question> questions;
  final int currentQuestionCount;
  final int totalQuestionsCount;
  final String selectedAlternative;
  final Function(String alternative) onPressAlternative;
  const AnswerQuizPage(
      {Key? key,
      required this.currentQuestionCount,
      required this.totalQuestionsCount,
      required this.selectedAlternative,
      required this.onPressAlternative,
      required this.questions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.s16,
          horizontal: AppSizes.s24,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.emoji_objects,
                  color: AppColors.yellow,
                ),
                const SizedBox(width: AppSizes.s4),
                Text(
                  'Pergunta $currentQuestionCount/ $totalQuestionsCount',
                  style: AppTextStyles.defaultYellowText,
                ),
              ],
            ),
            VerticalSpace.s24,
            Expanded(
              child: Stack(
                children: questions.reversed
                    .map<Widget>(
                      (question) => QuestionCard(
                        question: question,
                        selectedAlternative: selectedAlternative,
                        onPressAlternative: onPressAlternative,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
