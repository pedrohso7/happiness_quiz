import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/widgets/default_appbar.dart';
import 'pages/home_page.dart';

class HomePresenter extends StatelessWidget {
  const HomePresenter({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppbar(withBackButton: false),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.s16,
          horizontal: AppSizes.s24,
        ),
        child: HomePage(),
      ),
    );
  }
}
