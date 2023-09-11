enum QuestionType { multiple, boolean }

// enum QuestionCategory { multiple, boolean }
enum QuestionDifficulty { easy, medium, hard, random }

abstract class Question {
  final String category;
  final String question;
  final QuestionType type;
  final QuestionDifficulty difficulty;
  final String correctAlternative;
  final List<String> alternatives;

  Question(
    this.category,
    this.question,
    this.type,
    this.difficulty,
    this.correctAlternative,
    this.alternatives,
  );
}
