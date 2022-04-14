import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favorite color?',
      'answer': ['Black', 'Red', 'Green', 'White', 'Yellow']
    },
    {
      'questionText': 'what\'s your favorite animal?',
      'answer': ['Panda', 'Tiger', 'Lion', 'Dog', 'Horse']
    },
    {
      'questionText': 'who\'s your favorite guy?',
      'answer': ['Max', 'Min', 'Tom', 'Tommy']
    }
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("we have more questions!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: Column(
            children: [
              Question(
                _questions[_questionIndex]['questionText'] as String,
              ),
              ...(_questions[_questionIndex]['answer'] as List<String>)
                  .map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList()
            ],
          )),
    );
  }
}
