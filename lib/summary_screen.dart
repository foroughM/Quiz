import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/models/question_summary.dart';

class SummeryScreen extends StatelessWidget {
  const SummeryScreen({required this.summaryData, super.key});

  final List<QuestionSummary> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map((summaryEntry) {
              return SummaryItem(
                summaryItem: summaryEntry,
              );
            })
          ],
        ),
      ),
    );
  }
}

class SummaryItem extends StatelessWidget {
  const SummaryItem({required this.summaryItem, super.key});

  final QuestionSummary summaryItem;

  @override
  Widget build(BuildContext context) {
    Color questionIndexColor =
        summaryItem.correctAnswer == summaryItem.userAnswer
            ? Colors.green
            : Colors.red;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: questionIndexColor,
            child: Text(
              textAlign: TextAlign.center,
              (summaryItem.questionIndex + 1).toString(),
              style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  summaryItem.question,
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  summaryItem.userAnswer,
                  style: GoogleFonts.lato(color: Colors.purple, fontSize: 18),
                ),
                Text(
                  summaryItem.correctAnswer,
                  style: GoogleFonts.lato(color: Colors.blue, fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
