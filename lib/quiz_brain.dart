import 'question.dart';

class QuizBrain {
  List<Question> questionBank=[
        Question(
            q: 'Which company developed the Android operating system?',
            opts: ['Apple', 'Google', 'Microsoft', 'Samsung'],
            correct: 1,
        ),
        Question(
            q: 'What does GPU stand for?',
            opts: [
                'Central Processing Unit',
                'Computer Personal Unit',
                'Central Performance Unit',
                'Control Processing Unit',
                'None'
            ],
            correct: 5,
        ),
        ];
}
