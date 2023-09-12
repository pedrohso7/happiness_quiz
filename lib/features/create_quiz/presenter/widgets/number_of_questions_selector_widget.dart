import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/extensions/sized_box_extension.dart';

class NumberOfQuestionsSelectorWidget extends StatelessWidget {
  final int selectedValue;
  final Function(int) onPressItem;
  const NumberOfQuestionsSelectorWidget({
    Key? key,
    required this.selectedValue,
    required this.onPressItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        _buildNumberChip(
          5 == selectedValue,
          () => onPressItem(5),
          5,
        ),
        HorizontalSpace.s4,
        _buildNumberChip(
          10 == selectedValue,
          () => onPressItem(10),
          10,
        ),
        HorizontalSpace.s4,
        _buildNumberChip(
          15 == selectedValue,
          () => onPressItem(15),
          15,
        ),
        HorizontalSpace.s4,
        _buildNumberChip(
          20 == selectedValue,
          () => onPressItem(20),
          20,
        ),
        HorizontalSpace.s4,
        _buildNumberChip(
          25 == selectedValue,
          () => onPressItem(25),
          25,
        ),
      ],
    );
  }

  Widget _buildNumberChip(bool isSelected, VoidCallback onTap, int value) =>
      InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.s16),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.s8),
          child: Container(
            height: AppSizes.s48,
            width: AppSizes.s48,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.lightYellow : AppColors.lightGrey,
              border: Border.all(
                color: isSelected ? AppColors.yellow : AppColors.lightBlack,
                width: AppSizes.s2,
              ),
              borderRadius: BorderRadius.circular(AppSizes.s16),
            ),
            child: Center(
              child: Text(
                value.toString(),
                style: AppTextStyles.defaultBlackText,
              ),
            ),
          ),
        ),
      );
}
