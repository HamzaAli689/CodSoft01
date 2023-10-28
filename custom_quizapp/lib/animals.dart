import 'package:flutter/material.dart';

import 'first screen.dart';

class AQuizApp extends StatefulWidget {
  @override
  _AQuizAppState createState() => _AQuizAppState();
}

class _AQuizAppState extends State<AQuizApp> {
  int _questionIndex = 0;
  List<String> _questions = [
    'Elephants are the largest land animals.',
    'Cats are herbivores.',
    'Dolphins are fish.',
    'Giraffes have short necks.',
    'Kangaroos are native to Africa.',
    'Lions are known as the king of the jungle.',
    'Penguins can fly.',
    'Snakes are mammals.',
    'Tigers have stripes on their fur.',
    'Zebras have spots.',
    'Monkeys have tails.',
    'Sharks are mammals.',
    'Butterflies start as caterpillars.',

  ];

  List<bool> _answers = [
    true,  // Elephants are the largest land animals.
    false, // Cats are herbivores.
    false, // Dolphins are fish.
    false, // Giraffes have short necks.
    false, // Kangaroos are native to Africa.
    true,  // Lions are known as the king of the jungle.
    false, // Penguins can fly.
    false, // Snakes are mammals.
    true,  // Tigers have stripes on their fur.
    false, // Zebras have spots.
    true,  // Monkeys have tails.
    false, // Sharks are mammals.
    true,  // Butterflies start as caterpillars.

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
          title: Text('Animals Quiz'),
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
