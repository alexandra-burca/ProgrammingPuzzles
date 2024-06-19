abstract class QuizItem {}

class Question extends QuizItem {
  final String text;
  final List<String> answers;
  final int correctIndex;

  Question({
    required this.text,
    required this.answers,
    required this.correctIndex,
  });
}

class StaticScreen extends QuizItem {
  final String text;

  StaticScreen({required this.text});
}

class FinalScreen extends QuizItem {
  final String text;

  FinalScreen({required this.text});
}

class TextBoxQuestion extends QuizItem {
  final String question;
  final String correctAnswer;
  final String hint;

  TextBoxQuestion({
    required this.question,
    required this.correctAnswer,
    required this.hint,
  });
}