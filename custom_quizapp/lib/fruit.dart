import 'package:flutter/material.dart';

import 'first screen.dart';

class FQuizApp extends StatefulWidget {
  @override
  _FQuizAppState createState() => _FQuizAppState();
}

class _FQuizAppState extends State<FQuizApp> {
  int _questionIndex = 0;
  List<String> _questions = [
    'An apple is a type of fruit.',
    'Watermelon is a citrus fruit.',
    'Bananas grow on trees.',
    'Oranges are purple in color.',
    'Pineapple is a tropical fruit.',
    'Grapes are green in color.',
    'Strawberries are a type of berry.',
    'Mangoes are native to Antarctica.',
    'Blueberries are red in color.',
    'Peaches have a fuzzy skin.',
    'Lemons are sour in taste.',
    'Kiwi fruit is native to New Zealand.',
    'Cherries are a type of stone fruit.',

  ];

  List<bool> _answers = [
    true,  // An apple is a type of fruit.
    false, // Watermelon is a citrus fruit.
    true,  // Bananas grow on trees.
    false, // Oranges are purple in color.
    true,  // Pineapple is a tropical fruit.
    true,  // Grapes are green in color.
    true,  // Strawberries are a type of berry.
    false, // Mangoes are native to Antarctica.
    false, // Blueberries are red in color.
    true,  // Peaches have a fuzzy skin.
    true,  // Lemons are sour in taste.
    true,  // Kiwi fruit is native to New Zealand.
    true,  // Cherries are a type of stone fruit.

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
          title: Text('fruite Quiz'),
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
