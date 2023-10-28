import 'package:flutter/material.dart';

import 'first screen.dart';

class DQuizApp extends StatefulWidget {
  @override
  _DQuizAppState createState() => _DQuizAppState();
}

class _DQuizAppState extends State<DQuizApp> {
  int _questionIndex = 0;
  List<String> _questions = [
    'There are 5 days in a week.',
    'Sunday comes before Monday.',
    'Saturday is the last day of the week.',
    'Wednesday is the third day of the week.',
    'Friday comes after Thursday.',
    'There are 31 days in a month.',
    'December has 30 days.',
    'February is the fifth month of the year.',
    'January is the last month of the year.',
    'March has 30 days.',
    'September is the seventh month of the year.',
    'April has 28 days.',
    'November is the tenth month of the year.',

  ];

  List<bool> _answers = [
    false, // There are 5 days in a week.
    true,  // Sunday comes before Monday.
    false, // Saturday is the last day of the week.
    true,  // Wednesday is the third day of the week.
    false, // Friday comes after Thursday.
    false, // There are 31 days in a month.
    false, // December has 30 days.
    false, // February is the fifth month of the year.
    false, // January is the last month of the year.
    false, // March has 30 days.
    false, // September is the seventh month of the year.
    false, // April has 28 days.
    false, // November is the tenth month of the year.

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
          title: Text('Days Quiz'),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueAccent, Colors.pinkAccent],
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
