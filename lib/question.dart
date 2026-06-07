class Question {
  String questionText;
  List<String> options;
  int correctIndex;

  Question({required String q, required List<String> opts, required int correct})
      : questionText = q,
        options = opts,
        correctIndex = correct;
}

