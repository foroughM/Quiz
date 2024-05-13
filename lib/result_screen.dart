import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/models/question_summary.dart';
import 'package:quiz/summary_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.chosenAnswers, required this.onRetryClick, super.key});

  final void Function() onRetryClick;
  final List<String> chosenAnswers;

  List<QuestionSummary> get summaryData {
    final List<QuestionSummary> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        QuestionSummary(
            questionIndex: i,
            question: questions[i].text,
            correctAnswer: questions[i].answers[0],
            userAnswer: chosenAnswers[i]),
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int numberOfQuestions = questions.length;
    int numberOfCorrectAnswers = summaryData
        .where(
          (element) => element.correctAnswer == element.userAnswer,
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numberOfCorrectAnswers of $numberOfQuestions questions correctly.',
              style: GoogleFonts.lato(
                  color: Color.fromARGB(255, 226, 174, 174),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            SummeryScreen(
              summaryData: summaryData,
            ),
            SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRetryClick,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: Icon(Icons.refresh),
              label: Text('Retry quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
