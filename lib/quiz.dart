import 'package:flutter/material.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start_screen';
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (questions.length == selectedAnswers.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'start_screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions_screen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 78, 13, 151),
            const Color.fromARGB(255, 107, 15, 168),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Scaffold(
          backgroundColor: Color.fromARGB(1, 95, 3, 138),
          body: activeScreen == "start_screen"
              ? StartScreen(switchScreen)
              : QuestionScreen(chooseAnswer),
        ),
      ),
    );
  }
}
