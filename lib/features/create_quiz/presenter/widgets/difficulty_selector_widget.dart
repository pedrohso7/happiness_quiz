import 'package:flutter/material.dart';

import '../../../../core/constants/image_path.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../domain/entities/question.dart';

class DifficultySelectorWidget extends StatelessWidget {
  final QuestionDifficulty difficulty;
  final Function(QuestionDifficulty) onPressItem;
  const DifficultySelectorWidget({
    Key? key,
    required this.difficulty,
    required this.onPressItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (difficulty == QuestionDifficulty.easy) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _getCustomStar(
                      true, () => onPressItem(QuestionDifficulty.easy)),
                  HorizontalSpace.s8,
                  _getCustomStar(
                      false, () => onPressItem(QuestionDifficulty.medium)),
                  HorizontalSpace.s8,
                  _getCustomStar(
                      false, () => onPressItem(QuestionDifficulty.hard)),
                ],
              ),
              _getRandomStar(
                  false, () => onPressItem(QuestionDifficulty.random)),
            ],
          );
        }
        if (difficulty == QuestionDifficulty.medium) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _getCustomStar(
                      true, () => onPressItem(QuestionDifficulty.easy)),
                  HorizontalSpace.s8,
                  _getCustomStar(
                      true, () => onPressItem(QuestionDifficulty.medium)),
                  HorizontalSpace.s8,
                  _getCustomStar(
                      false, () => onPressItem(QuestionDifficulty.hard)),
                ],
              ),
              _getRandomStar(
                  false, () => onPressItem(QuestionDifficulty.random)),
            ],
          );
        }
        if (difficulty == QuestionDifficulty.hard) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _getCustomStar(
                      true, () => onPressItem(QuestionDifficulty.easy)),
                  HorizontalSpace.s8,
                  _getCustomStar(
                      true, () => onPressItem(QuestionDifficulty.medium)),
                  HorizontalSpace.s8,
                  _getCustomStar(
                      true, () => onPressItem(QuestionDifficulty.hard)),
                ],
              ),
              _getRandomStar(
                  false, () => onPressItem(QuestionDifficulty.random)),
            ],
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _getCustomStar(
                    false, () => onPressItem(QuestionDifficulty.easy)),
                HorizontalSpace.s8,
                _getCustomStar(
                    false, () => onPressItem(QuestionDifficulty.medium)),
                HorizontalSpace.s8,
                _getCustomStar(
                    false, () => onPressItem(QuestionDifficulty.hard)),
              ],
            ),
            _getRandomStar(true, () => onPressItem(QuestionDifficulty.random)),
          ],
        );
      },
    );
  }

  Widget _getCustomStar(bool isFilled, VoidCallback onTap) => InkWell(
        borderRadius: BorderRadius.circular(AppSizes.s40),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.s8),
          child: SizedBox(
            width: AppSizes.s40,
            height: AppSizes.s40,
            child: Image.asset(
              isFilled ? AppImages.starImagePath : AppImages.emptyStarImagePath,
              fit: BoxFit.fill,
            ),
          ),
        ),
      );

  Widget _getRandomStar(bool isFilled, VoidCallback onTap) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.s48),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.s8),
          child: SizedBox(
            width: AppSizes.s48,
            height: AppSizes.s48,
            child: Image.asset(
              isFilled
                  ? AppImages.randomImagePath
                  : AppImages.emptyRandomImagePath,
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
}
