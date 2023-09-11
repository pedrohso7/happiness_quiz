import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/constants/text_style.dart';
import '../../../core/widgets/default_appbar.dart';
import 'bloc/create_quiz_bloc.dart';
import 'pages/create_quiz_page.dart';

class CreateQuizPresenter extends StatefulWidget {
  final String category;
  const CreateQuizPresenter({super.key, required this.category});

  @override
  State<CreateQuizPresenter> createState() => _CreateQuizPresenter();
}

class _CreateQuizPresenter extends State<CreateQuizPresenter> {
  late CreateQuizBloc createQuizBloc;
  @override
  void initState() {
    createQuizBloc = CreateQuizBloc.get(context);
    super.initState();
  }

  void _goBack() => context.pop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        title: 'New Quiz',
        onPressBackButton: _goBack,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.s16,
          horizontal: AppSizes.s24,
        ),
        child: BlocBuilder<CreateQuizBloc, CreateQuizState>(
          builder: (context, state) {
            if (state is CreateQuizDefault) {
              return CreateQuizPage(
                category: widget.category,
                numberOfQuestions: state.numberOfQuestions,
                difficulty: state.difficulty,
              );
            }
            if (state is CreateQuizLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CreateQuizError) {
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
