import 'package:flutter/material.dart';

import '../../../../core/constants/image_path.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/extensions/sized_box_extension.dart';

class CategoryListItem extends StatelessWidget {
  final String? imagePath;
  final String title;
  final VoidCallback onPressListItem;
  const CategoryListItem({
    Key? key,
    required this.title,
    this.imagePath,
    required this.onPressListItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(AppSizes.s4),
          leading: imagePath != null
              ? SizedBox(
                  width: AppSizes.s56,
                  height: AppSizes.s56,
                  child: Image.asset(
                    imagePath!,
                    fit: BoxFit.fill,
                  ),
                )
              : Image.asset(AppImages.logoPath),
          title: Text(
            title,
            style: AppTextStyles.defaultText,
          ),
          onTap: onPressListItem,
        ),
        VerticalSpace.s8,
      ],
    );
  }
}
