import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/data/questions.dart';

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

  String? activeScreen = 'ResultScreen';
  // start to questions
  void switchScreen() {
    setState(() {
      activeScreen = 'QuestionScreen';
    });
  }

  List<String> selectedAnswer = [];
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    // END OF ALL QUESTION
    if (selectedAnswer.length == questions.length) {
      setState(() {
        // now we are switching to result screen and then reseting answers
        //selectedAnswer = []; // setting list of answers to empty
        activeScreen = 'ResultScreen';
      });
    }
  }

  //result to start
  void restartQuiz() {
    setState(() {
      // now here we dont need selected answers anymore
      selectedAnswer = [];
      activeScreen = 'StartScreen';
    });
  }

  Widget selectFunction() {
    if (activeScreen == 'StartScreen') {
      return StartScreen(switchScreen);
    } else if (activeScreen == 'QuestionScreen') {
      return QuestionScreen(chooseAnswer);
    } else if (activeScreen == 'ResultScreen') {
      return ResultScreen(restartQuiz, selectedAnswer);
    }
    return const Text('ERROR LOL!!!@!!');
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
            child: selectFunction()

            // child: activeScreen == 'StartScreen'
            //     ? StartScreen(
            //         switchScreen) // this function is recieved by strt_screen.dart
            //     : QuestionScreen(
            //         chooseAnswer), //which is Func for StartQuiz Button pressed
            // which changes the variable in this file
            //and chenges screen to quiz screen
            ),
      ),
    );
  }
}
