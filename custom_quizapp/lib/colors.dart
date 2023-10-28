import 'package:flutter/material.dart';

import 'first screen.dart';

class CQuizApp extends StatefulWidget {
  @override
  _CQuizAppState createState() => _CQuizAppState();
}

class _CQuizAppState extends State<CQuizApp> {
  int _questionIndex = 0;
  List<String> _questions = [
    'The color red is the same as the color blue.',
    'Yellow is a primary color.',
    'Green is made by mixing blue and red.',
    'Orange is a secondary color.',
    'Black is the absence of color.',
    'Pink is a warm color.',
    'Purple is made by mixing red and yellow.',
    'White is the combination of all colors.',
    'Brown is a primary color.',
    'Gray is a vibrant color.',
    'The color purple is often associated with royalty.',
    'Cyan is a shade of green.',
    'Magenta is a shade of blue.',

  ];

  List<bool> _answers = [
    false, // The color red is the same as the color blue.
    true,  // Yellow is a primary color.
    false, // Green is made by mixing blue and red.
    true,  // Orange is a secondary color.
    true,  // Black is the absence of color.
    false, // Pink is a warm color.
    false, // Purple is made by mixing red and yellow.
    true,  // White is the combination of all colors.
    false, // Brown is a primary color.
    false, // Gray is a vibrant color.
    true,  // The color purple is often associated with royalty.
    false, // Cyan is a shade of green.
    false, // Magenta is a shade of blue.

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
          title: Text('Color Quiz'),
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
             // mainAxisAlignment: MainAxisAlignment.center,
             // crossAxisAlignment: CrossAxisAlignment.center,



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
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _icons.map((icon) => Icon(icon)).toList(),
                  ),
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
