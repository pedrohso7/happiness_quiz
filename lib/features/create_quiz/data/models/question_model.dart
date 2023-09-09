import 'dart:convert';
import '../../domain/entities/question.dart';

class QuestionModel extends Question {
  QuestionModel(
    String category,
    String question,
    QuestionType type,
    QuestionDifficulty difficulty,
    String correctAlternative,
    List<String> alternatives,
  ) : super(
          category,
          question,
          type,
          difficulty,
          correctAlternative,
          alternatives,
        );

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'question': question,
      'type': type,
      "difficulty": difficulty,
      "correctAlternative": correctAlternative,
      "alternativas": alternatives,
    };
  }

  factory QuestionModel.fromMap(Map map) {
    final List<String> alternatives = [
      ...map['incorrect_answers'],
      map['correct_answer'],
    ];
    alternatives.shuffle();

    QuestionType getType(String value) {
      if (value == 'multiple') return QuestionType.multiple;
      return QuestionType.boolean;
    }

    QuestionDifficulty getDifficulty(String value) {
      if (value == "easy") return QuestionDifficulty.easy;
      if (value == "medium") return QuestionDifficulty.medium;
      return QuestionDifficulty.hard;
    }

    return QuestionModel(
      map['category'],
      map['question'],
      getType(map['type']),
      getDifficulty(map['difficulty']),
      map['correct_answer'],
      alternatives,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}
