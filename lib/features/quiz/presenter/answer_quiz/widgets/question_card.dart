import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_style.dart';
import '../../../../../core/extensions/sized_box_extension.dart';
import '../../../../../core/mixins/html_conversion_mixin.dart';
import '../../../domain/entities/question.dart';
import 'alternative_list_item.dart';

class QuestionCard extends StatelessWidget with HtmlConversionMixin {
  final Question question;
  final String selectedAlternative;
  final Function(String) onPressAlternative;
  const QuestionCard({
    Key? key,
    required this.question,
    required this.selectedAlternative,
    required this.onPressAlternative,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(
          AppSizes.s32,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          VerticalSpace.s24,
          Text(
            decodeHtmlEntities(question.question),
            style: AppTextStyles.defaultBlackText,
          ),
          const SizedBox(height: AppSizes.s32),
          Expanded(
            child: ListView.builder(
              itemCount: question.alternatives.length,
              itemBuilder: (context, index) => AlternativeListItem(
                isSelected: question.alternatives[index] == selectedAlternative,
                title: question.alternatives[index],
                onPressListItem: () =>
                    onPressAlternative(question.alternatives[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
