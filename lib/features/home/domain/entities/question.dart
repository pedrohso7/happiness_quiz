enum QuestionType { multiple, boolean }

// enum QuestionCategory { multiple, boolean }
enum QuestionDifficult { easy, medium, hard }

abstract class Question {
  final String category;
  final String question;
  final QuestionType type;
  final QuestionDifficult difficult;
  final String correctAlternative;
  final List<String> alternatives;

  Question(
    this.category,
    this.question,
    this.type,
    this.difficult,
    this.correctAlternative,
    this.alternatives,
  );
}
