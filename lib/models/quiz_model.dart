// ignore_for_file: public_member_api_docs, avoid_equals_and_hash_code_on_mutable_classes

class QuizModel {
  QuizModel({
    required this.category,
    required this.correctAnswer,
    required this.multipleCorrectAnswers,
    required this.question,
    required this.answers,
    required this.selectedAnswers,
    this.cAnswer,
    this.description,
    this.isCorrect = false,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        cAnswer: json['correct_answer'] as String?,
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
        correctAnswer: (json['correct_answers'] as Map).entries.map((e) {
          final key = (e.key as String).substring(0, 8);
          return Answer(
            key: key,
            answer: e.value as String,
          );
        }).toList(),
        selectedAnswers: [],
      );
  final String? cAnswer;
  final String multipleCorrectAnswers;
  final String question;
  final String? description;
  final List<Answer> answers;
  final List<Answer> correctAnswer;
  final List<Answer> selectedAnswers;
  final String category;
  bool isCorrect;

  // @override
  // String toString() => 'QuizModel(question: $question, '
  //' description: $description,'' answerA: $answerA, answerB: $answerB,'
  //' answerC: $answerC, answerD: $answerD,)';
}

// class CorrectAnswer {
//   CorrectAnswer({
//     required this.key,
//     required this.correctAnswer,
//   });

//   final String key;
//   final String correctAnswer;
// }

class Answer {
  Answer({
    required this.key,
    this.answer,
  });

  final String key;
  final String? answer;

  @override
  bool operator ==(Object other) =>
      other is Answer && other.key == key && other.answer == answer;

  @override
  int get hashCode => Object.hash(key, answer);

  @override
  String toString() => 'Anser($key , $answer)';
}
