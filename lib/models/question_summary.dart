class QuestionSummary {
  const QuestionSummary({
    required this.questionIndex,
    required this.question,
    required this.correctAnswer,
    required this.userAnswer,
  });

  final int questionIndex;
  final String question;
  final String correctAnswer;
  final String userAnswer;
}
