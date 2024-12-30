import 'package:flutter/material.dart';
import 'package:flutter_poc/data/questiion.dart';
import 'package:flutter_poc/quizApp/question_summery.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummeryData() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answers": chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summeryData = getSummeryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestions = summeryData.where((data) {
      return data["user_answers"] == data["correct_answer"];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestion question correctly !",
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 230, 200, 253),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummery(summeryData: getSummeryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: onRestart ,
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: const Text(
                "Restart Quiz !",
              ),
            )
          ],
        ),
      ),
    );
  }
}
