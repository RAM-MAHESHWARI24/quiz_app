import 'package:flutter/material.dart';
import 'package:quiz_app/model/answer_button.dart';
import 'package:quiz_app/model/quiz_question.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int curQuestionidx = 0;
  void nextQuestion() {
    setState(() {
      curQuestionidx++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[curQuestionidx];
    return Container(
      // margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 151, 66, 155),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            // ...dots converts Iterable<Widget> into List<Widget>
            //[1,2,3,4,5,6] to 1,2,3,4,5,6
            //map takes all elemets in answer ie List<String> in this case
            // then pass item to a functionwe define and then we can return what
            //we want in this case Widget that is ElevatedButton which is inside
            //of AnswerButton
            // # map create a copy of list then perform Function on it
            ...currentQuestion.shuffleOptions().map((item) {
              // we copied the list and shuffled it and are returning it using
              // a method called shuffleOptions() which is memeber of QuizQuestion
              //AnswerButton is child of QuizQuestion
              return AnswerButton(item, nextQuestion);
              // just name of function acts as a pointer to function
              // in this case this pointer is passed to AnswerButton's
              //constructor and there it binds to onTap variable
              // which is excecuted in elevatedbutton onPressed
            })

            //W/O map function
            // AnswerButton(currentQuestion.answers[0], () {}),
            // AnswerButton(currentQuestion.answers[1], () {}),
            // AnswerButton(currentQuestion.answers[2], () {}),
            // AnswerButton(currentQuestion.answers[3], () {}),
          ],
        ),
      ),
    );
  }
}
