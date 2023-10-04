import 'package:flutter/material.dart';
import 'package:happiness_quiz/core/widgets/filled_container.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_style.dart';
import '../../../domain/entities/question.dart';
import '../widgets/alternative_list_item.dart';

class AnswerQuizPage extends StatelessWidget {
  final List<Question> questions;
  final int currentQuestionCount;
  final String selectedAlternative;
  final Function(String alternative) onPressAlternative;
  const AnswerQuizPage(
      {Key? key,
      required this.currentQuestionCount,
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
        child: Stack(
          children: [
            ...questions
                .map<Widget>(
                  (question) => Positioned(
                    child: Container(
                      color: AppColors.white,
                      child: Column(
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
                                'Pergunta $currentQuestionCount/ ${questions.length}',
                                style: AppTextStyles.defaultYellowText,
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSizes.s24),
                          Text(
                            question.question,
                            style: AppTextStyles.subTitle,
                          ),
                          const SizedBox(height: AppSizes.s32),
                          Expanded(
                            child: ListView.builder(
                              itemCount: question.alternatives.length,
                              itemBuilder: (context, index) =>
                                  AlternativeListItem(
                                alternativeNumber: index + 1,
                                isSelected: question.alternatives[index] ==
                                    selectedAlternative,
                                title: question.alternatives[index],
                                onPressListItem: () => onPressAlternative,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
