import 'dart:convert';
import '../../domain/entities/question.dart';

class QuestionModel extends Question {
  QuestionModel(
    String category,
    String question,
    QuestionType type,
    QuestionDifficult difficult,
    String correctAlternative,
    List<String> alternatives,
  ) : super(
          category,
          question,
          type,
          difficult,
          correctAlternative,
          alternatives,
        );

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'question': question,
      'type': type,
      "difficult": difficult,
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

    QuestionDifficult getDifficult(String value) {
      if (value == "easy") return QuestionDifficult.easy;
      if (value == "medium") return QuestionDifficult.medium;
      return QuestionDifficult.hard;
    }

    return QuestionModel(
      map['category'],
      map['question'],
      getType(map['type']),
      getDifficult(map['difficult']),
      map['correct_answer'],
      alternatives,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}
