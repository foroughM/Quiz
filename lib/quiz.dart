import 'package:flutter/material.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/result_screen.dart';
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
  List<String> _selectedAnswers = [];

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if (questions.length == _selectedAnswers.length) {
      setState(() {
        activeScreen = 'result_screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions_screen';
    });
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      activeScreen = 'questions_screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions_screen') {
      screenWidget = QuestionScreen(chooseAnswer);
    } else if (activeScreen == 'result_screen') {
      screenWidget = ResultScreen(
        chosenAnswers: _selectedAnswers,
        onRetryClick: restartQuiz,
      );
    }

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
          body: screenWidget,
        ),
      ),
    );
  }
}
