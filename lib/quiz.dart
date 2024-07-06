import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Like this we can change state or
  // Widget? activeScreen;
  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);
  // }
  // // Passing switchScreen pointer to StartScreen Class

  //void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionScreen();
  //   });
  // }
  var activeScreen = 'StartScreen';
  void switchScreen() {
    setState(() {
      activeScreen = 'QuestionScreen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: const Center(
            child: Text(
              'QuizPro',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 27, 2, 95),
              Color.fromARGB(255, 49, 12, 150)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          // child: activeScreen,
          child: activeScreen == 'StartScreen'
              ? StartScreen(
                  switchScreen) // this function is recieved by strt_screen.dart
              : const QuestionScreen(), //which is Func for StartQuiz Button pressed
          // which changes the variable in this file
          //and chenges screen to quiz screen
        ),
      ),
    );
  }
}
