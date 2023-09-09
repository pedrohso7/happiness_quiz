import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/constants/text_style.dart';
import '../../../core/widgets/default_appbar.dart';
import 'bloc/home_bloc.dart';
import 'pages/home_page.dart';

class HomePresenter extends StatefulWidget {
  const HomePresenter({super.key});

  @override
  State<HomePresenter> createState() => _HomePresenter();
}

class _HomePresenter extends State<HomePresenter> {
  late HomeBloc homeBloc;
  @override
  void initState() {
    homeBloc = HomeBloc.get(context);
    homeBloc.add(const GetQuestions());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(withBackButton: false),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.s16,
          horizontal: AppSizes.s24,
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return HomePage(questions: state.questions);
            }
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeError) {
              return Center(
                child: Text(
                  state.message,
                  style: AppTextStyles.subTitle,
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
