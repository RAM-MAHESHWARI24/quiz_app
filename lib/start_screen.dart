import 'package:flutter/material.dart';

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
          const Text(
            'Learn Flutter The Fun Way',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          OutlinedButton.icon(
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
