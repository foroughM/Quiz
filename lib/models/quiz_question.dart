class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shufflesList = List.of(answers);
    shufflesList.shuffle();
    return shufflesList;
  }
}
