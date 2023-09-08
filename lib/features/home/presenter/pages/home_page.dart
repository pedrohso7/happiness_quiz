import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/widgets/default_button.dart';
import '../../domain/entities/question.dart';
import '../widgets/answered_quiz_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.questions,
  }) : super(key: key);

  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard',
              style: AppTextStyles.title,
            ),
            const SizedBox(
              height: AppSizes.s16,
            ),
            const Divider(
              thickness: AppSizes.s2,
              color: AppColors.white,
            ),
            const SizedBox(
              height: AppSizes.s16,
            ),
            const Text('Histórico:', style: AppTextStyles.subTitle),
            const SizedBox(
              height: AppSizes.s16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) => AnsweredQuizListItem(
                  correctAnswersCount: questions.length,
                  totalAnswersCount: questions[index].alternatives.length,
                  title: questions[index].question,
                  onPressListItem: () => {},
                ),
              ),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.only(bottom: AppFontSizes.s24),
          alignment: Alignment.bottomRight,
          child: DefaultButton(
            height: AppSizes.s80,
            width: AppSizes.s80,
            borderRadius: AppSizes.s80,
            label: '+Quiz',
            onPressed: () => {},
          ),
        ),
      ],
    );
  }
}
