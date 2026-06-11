import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'result_widget.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black54,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: const QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Icon> scoreKeeper = [];
  int score = 0;
  bool finished = false;
  int questionNum = 0;

  void _answer(int selectedIndex) {
    final correct = quizBrain.questionBank[questionNum].correctIndex;
    setState(() {
      if (selectedIndex == correct) {
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
        score++;
      } else {
        scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
      }

      if (questionNum < quizBrain.questionBank.length - 1) {
        questionNum++;
      } else {
        finished = true;
      }
    });
  }

  void _restart() {
    setState(() {
      scoreKeeper.clear();
      score = 0;
      questionNum = 0;
      finished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = quizBrain.questionBank[questionNum];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
          child: Text(
            question.questionText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              height: 1.4,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Expanded(
          child: finished
              ? ResultWidget(
                  score: score,
                  total: quizBrain.questionBank.length,
                  onRestart: _restart,
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: question.options
                      .asMap()
                      .entries
                      .map((entry) => AnswerButton(
                            text: entry.value,
                            onPressed: () => _answer(entry.key),
                          ))
                      .toList(),
                ),
        ),
        const SizedBox(height: 18),
        SizedBox(
          height: 80,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: scoreKeeper),
          ),
        ),
      ],
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AnswerButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6C63FF),
          foregroundColor: Colors.white,
          elevation: 8,
          shadowColor: Colors.black54,
          minimumSize: const Size(double.infinity, 64),
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
