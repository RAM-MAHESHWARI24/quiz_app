import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  // acepting a function which returns void and takes no arguments as startQuiz
  // which is also a class variable that stores a function
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // const Text(
          //   'QuizPro',
          //   style: TextStyle(
          //     fontSize: 24,
          //     color: Colors.white,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // const SizedBox(height: 20),
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            alignment: Alignment.center,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //     alignment: Alignment.center,
          //   ),
          // ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Learn Flutter The Fun Way',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          OutlinedButton.icon(
            //From
            onPressed: startQuiz,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 80, vertical: 1),
            ),
            icon: const Icon(Icons.arrow_right_outlined),
            label: const Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}
