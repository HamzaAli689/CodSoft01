import 'package:flutter/material.dart';

import 'first screen.dart';

class MQuizApp extends StatefulWidget {
  @override
  _MQuizAppState createState() => _MQuizAppState();
}

class _MQuizAppState extends State<MQuizApp> {
  int _questionIndex = 0;
  List<String> _questions = [
    'January has 28 days.',
    'March is the second month of the year.',
    'June has 31 days.',
    'October comes before September.',
    'December is the sixth month of the year.',
    'August has 30 days.',
    'April is the first month of the year.',
    'May has 30 days.',
    'July is the seventh month of the year.',
    'November is the ninth month of the year.',
    'February has 29 days in a leap year.',
    'September has 30 days.',
    'April has 31 days.',

  ];

  List<bool> _answers = [
    false, // January has 28 days.
    false, // March is the second month of the year.
    true,  // June has 31 days.
    true,  // October comes before September.
    false, // December is the sixth month of the year.
    false, // August has 30 days.
    false, // April is the first month of the year.
    true,  // May has 30 days.
    true,  // July is the seventh month of the year.
    false, // November is the ninth month of the year.
    true,  // February has 29 days in a leap year.
    true,  // September has 30 days.
    true,  // April has 31 days.

  ];

  List<IconData> _icons = [];
  bool _showResult = false;

  void checkAnswer(bool answer) {
    setState(() {
      _icons.add(
        answer == _answers[_questionIndex] ? Icons.check : Icons.close,
      );
      _questionIndex++;
      if (_questionIndex >= _questions.length) {
        _showResult = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.blueAccent,
          title: Text('Month Quiz'),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueAccent, Colors.pinkAccent], // Replace with your desired gradient colors
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,


              children: [
                Expanded(
                  flex: 7,
                  child: Container(child: Center(child: Text(
                    _showResult ? 'Quiz Completed!' : _questions[_questionIndex],
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),),),
                ),
                SizedBox(height: 16.0),
                Expanded(
                  child: SizedBox(), // Placeholder for the empty space
                ),
                Column(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () => checkAnswer(true),
                      child: Text('True'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16.0),
                        backgroundColor: Colors.greenAccent,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    ElevatedButton(
                      onPressed: () => checkAnswer(false),
                      child: Text('False'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16.0),
                        backgroundColor: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _icons.map((icon) => Icon(icon)).toList(),
                ),
                SizedBox(height: 16.0),
                _showResult
                    ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _questionIndex = 0;
                      _icons.clear();
                      _showResult = false;
                    });
                  },
                  child: Text('Restart Quiz'),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(16.0),
                      backgroundColor: Colors.redAccent
                  ),
                )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
