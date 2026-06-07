import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  
  List<Icon>scoreKeeper = [];

  // List<String> questions =[
  //   "You can lead a cow down stairs but not up stairs.",
  //   "Approximately one quarter of human bones are in the feet.",
  //   "A slug\'s blood is green."
  // ];

  // List<bool> answers = [
  //    false,
  //    true,
  //    true
  // ];

  // Question q1 = Question(q: "You can lead a cow down stairs but not up stairs.",a: false)

  

   int questionNum = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.questionBank[questionNum].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(4, (index) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueGrey[700],
                    ),
                    child: Text(
                      quizBrain.questionBank[questionNum].options.length > index
                          ? quizBrain.questionBank[questionNum].options[index]
                          : '',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    onPressed: () {
                      setState(() {
                        int correct = quizBrain.questionBank[questionNum].correctIndex;
                        if (index == correct) {
                          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                        } else {
                          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                        }
                        if (questionNum < quizBrain.questionBank.length - 1) {
                          questionNum++;
                        }
                      });
                    },
                  ),
                ),
              );
            }),
          ),
        ),
        Row(children: scoreKeeper),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
