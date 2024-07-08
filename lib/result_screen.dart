import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(this.restartQuiz, this.selectedAnswer, {super.key});
  void Function() restartQuiz;
  List<String> selectedAnswer;
  List<Map<String, Object>> summary = [];
  List<Map<String, Object>> getSummary() {
    for (int i = 0; i < selectedAnswer.length; i++) {
      summary.add({
        'q_idx': i,
        'ques': questions[i].text,
        'correct_ans': questions[i].answers[0],
        'user_ans': selectedAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    summary = getSummary();
    final totalQ = questions.length;
    final correctQ = summary.where((data) {
      return (data['correct_ans'] == data['user_ans']) ? true : false;
    }).length;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "You answered $correctQ Question Correctly Out of $totalQ",
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionSummary(summary),
            // Q/A
            // // loop all questions
            // const Text(
            //   'Questions',
            //   style: TextStyle(color: Colors.white, fontSize: 24),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // const Text(
            //   'Answers',
            //   style: TextStyle(color: Colors.white, fontSize: 24),
            // ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.restart_alt_sharp,
                color: Colors.white,
              ),
              onPressed: restartQuiz,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
              label: const Text(
                'Restart Quiz!!',
              ),
            )
          ],
        ),
      ),
    );
  }
}
