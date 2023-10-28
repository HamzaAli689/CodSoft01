import 'package:custom_quizapp/splashscreen.dart';
import 'package:flutter/material.dart';
// Import other screens or widgets for your quiz app

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',

      theme: ThemeData(
        // Set your app's theme
        primarySwatch: Colors.blue,

      ),



      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(), // Set the SplashScreen as the initial screen
        // Add routes for other screens in your app
      },
    );
  }
}
