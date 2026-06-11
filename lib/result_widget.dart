import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final int score;
  final int total;
  final VoidCallback onRestart;

  const ResultWidget({super.key, required this.score, required this.total, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    final int passThreshold = (total / 2).ceil();
    final bool passed = score >= passThreshold;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.white,
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  passed ? Icons.emoji_events : Icons.sentiment_dissatisfied,
                  size: 76,
                  color: passed ? Colors.green : Colors.red,
                ),
                const SizedBox(height: 14),
                Text(
                  passed ? 'Success!' : 'Failed',
                  style: const TextStyle(fontSize: 26, color: Colors.black87, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                Text(
                  'Score: $score / $total',
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 6),
                Text(
                  'Your max score is $total.',
                  style: const TextStyle(fontSize: 16, color: Colors.black45),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: onRestart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: passed ? Colors.green : Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    child: const Text('Restart Quiz'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
