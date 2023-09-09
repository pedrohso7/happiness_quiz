import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../core/helpers/category_helper.dart';
import '../../../../core/widgets/default_button.dart';
import '../../domain/entities/question.dart';
import '../widgets/category_list_item.dart';

class CreateQuizPage extends StatelessWidget {
  const CreateQuizPage({
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
            VerticalSpace.s16,
            const Divider(
              thickness: AppSizes.s2,
              color: AppColors.white,
            ),
            VerticalSpace.s16,
            const Text('Categorias:', style: AppTextStyles.subTitle),
            VerticalSpace.s16,
            Expanded(
              child: ListView.builder(
                itemCount: CategoryHelper.allCategories.length,
                itemBuilder: (context, index) => CategoryListItem(
                  title: CategoryHelper.allCategories[index],
                  imagePath: CategoryHelper.categoryToImagePathMap[
                      CategoryHelper.allCategories[index]],
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
