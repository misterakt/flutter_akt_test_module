import 'package:flutter/material.dart';
import 'package:quickblox_sdk/quickblox_sdk.dart';
import './login.dart';
import './question.dart';
import './answer.dart';

//void main() => runApp(MyApp());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const String APP_ID = "96100";
  const String AUTH_KEY = "fRJC2X9sXA4K3mX";
  const String AUTH_SECRET = "VfjX8EhROpCBsmq";
  const String ACCOUNT_KEY = "svTT2TMJrRxLw6ee7xsh";
  const String API_ENDPOINT = ""; //optional
  const String CHAT_ENDPOINT = ""; //optional

  try {
    await QB.settings.init(APP_ID, AUTH_KEY, AUTH_SECRET, ACCOUNT_KEY,
        apiEndpoint: API_ENDPOINT, chatEndpoint: CHAT_ENDPOINT);
  } catch (e) {
    print(e.toString());
  }

  runApp(MyApp());
}

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
        body: Login(),
      ),
    );
  }
}
