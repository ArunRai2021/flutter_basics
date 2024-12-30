import 'package:flutter/material.dart';
import 'package:flutter_poc/data/questiion.dart';
import 'package:flutter_poc/quizApp/question_screen.dart';
import 'package:flutter_poc/quizApp/result_screen.dart';
import 'package:flutter_poc/quizApp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }
 void restartQuiz(){
    setState(() {
      selectedAnswers= [];
      activeScreen = "question-screen";
    });
 }
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = "results-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(startQuiz: switchScreen);
    if (activeScreen == "question-screen") {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == "results-screen") {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: screenWidget),
        ));
  }
}
