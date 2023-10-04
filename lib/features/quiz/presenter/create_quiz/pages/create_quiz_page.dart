import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_style.dart';
import '../../../../../core/extensions/sized_box_extension.dart';
import '../../../../../core/helpers/category_helper.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../core/widgets/filled_container.dart';
import '../../../domain/entities/question.dart';
import '../bloc/create_quiz_bloc.dart';
import '../widgets/difficulty_selector_widget.dart';
import '../widgets/number_of_questions_selector_widget.dart';

class CreateQuizPage extends StatelessWidget {
  const CreateQuizPage({
    Key? key,
    required this.category,
    required this.numberOfQuestions,
    required this.difficulty,
    required this.goToAnswerQuizPage,
  }) : super(key: key);

  final String category;
  final int numberOfQuestions;
  final QuestionDifficulty difficulty;
  final Function(List<Question> questions) goToAnswerQuizPage;

  @override
  Widget build(BuildContext context) {
    final CreateQuizBloc bloc = CreateQuizBloc.get(context);

    void setDifficulty(QuestionDifficulty difficulty) =>
        bloc.add(SetDifficultyEvent(difficulty: difficulty));
    void setNumberOfQuestions(int numberOfQuestions) => bloc
        .add(SetNumberOfQuestionsEvent(numberOfQuestions: numberOfQuestions));

    void getQuestions() {
      bloc.add(
        GetQuestionsEvent(
            difficulty, numberOfQuestions, goToAnswerQuizPage, category),
      );
    }

    return FilledContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: AppSizes.s80,
                    height: AppSizes.s80,
                    child: Image.asset(
                      CategoryHelper.categoryToImagePathMap[category]!,
                      fit: BoxFit.fill,
                    ),
                  ),
                  HorizontalSpace.s16,
                  Text(
                    category,
                    style: AppTextStyles.title,
                  ),
                ],
              ),
              VerticalSpace.s16,
              const Divider(
                thickness: AppSizes.s2,
                color: AppColors.white,
              ),
              VerticalSpace.s16,
              const Text('Difficulty:', style: AppTextStyles.subTitle),
              VerticalSpace.s16,
              DifficultySelectorWidget(
                difficulty: difficulty,
                onPressItem: setDifficulty,
              ),
              VerticalSpace.s16,
              const Text('Number of questions:', style: AppTextStyles.subTitle),
              VerticalSpace.s16,
              NumberOfQuestionsSelectorWidget(
                selectedValue: numberOfQuestions,
                onPressItem: setNumberOfQuestions,
              ),
            ],
          ),
          DefaultButton(
            width: MediaQuery.of(context).size.width,
            label: "Iniciar Quiz",
            onPressed: () => getQuestions(),
          ),
        ],
      ),
    );
  }
}
