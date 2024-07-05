// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
//import 'package:flutter/quiz_begin.dart';
import 'package:quiz_app/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: const Text('QUIZ APP'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 27, 2, 95),
              Color.fromARGB(255, 49, 12, 150)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: const StartScreen(),
        ),
      ),
    ),
  );
}
