// ignore_for_file: public_member_api_docs

class QuizModel {
  QuizModel({
    required this.category,
    required this.correctAnswer,
    required this.multipleCorrectAnswers,
    required this.question,
    required this.answers,
    this.description,
    this.isCorrect = false,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        category: json['category'] as String,
        question: json['question'] as String,
        description: json['description'] as String?,
        answers: (json['answers'] as Map)
            .entries
            .map(
              (e) => Answer(
                key: e.key as String,
                answer: e.value as String?,
              ),
            )
            .toList(),
        multipleCorrectAnswers: json['multiple_correct_answers'] as String,
        correctAnswer: (json['correct_answers'] as Map)
            .entries
            .map(
              (e) => CorrectAnswer(
                key: e.key as String,
                correctAnswer: e.value as String,
              ),
            )
            .toList(),
      );
  final String multipleCorrectAnswers;
  final String question;
  final String? description;
  final List<Answer> answers;
  final List<CorrectAnswer> correctAnswer;
  final String category;
  bool isCorrect;

  // @override
  // String toString() => 'QuizModel(question: $question, '
  //' description: $description,'' answerA: $answerA, answerB: $answerB,'
  //' answerC: $answerC, answerD: $answerD,)';
}

class CorrectAnswer {
  CorrectAnswer({
    required this.key,
    required this.correctAnswer,
  });

  final String key;
  final String correctAnswer;
}

class Answer {
  Answer({
    required this.key,
    this.answer,
  });

  final String key;
  final String? answer;
}
