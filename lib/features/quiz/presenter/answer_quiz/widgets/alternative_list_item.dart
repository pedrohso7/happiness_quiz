import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_style.dart';

class AlternativeListItem extends StatelessWidget {
  final String title;
  final int alternativeNumber;
  final VoidCallback onPressListItem;
  final bool isSelected;
  const AlternativeListItem({
    Key? key,
    required this.title,
    required this.alternativeNumber,
    required this.onPressListItem,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.s8),
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: AppColors.yellow),
          borderRadius: BorderRadius.circular(AppSizes.s24),
        ),
        selectedColor: AppColors.warningBackgroundColor,
        tileColor:
            isSelected ? AppColors.warningBackgroundColor : AppColors.white,
        title: Text(
          title,
          style: AppTextStyles.defaultBlackText,
          textAlign: TextAlign.center,
        ),
        onTap: onPressListItem,
      ),
    );
  }
}
