/*
Create a quiz app that allows users to answer multiple-choice questions. Use a combination 
of Map and List to store the questions and options for each question, and allow the user 
to select one of the options.
 */
import 'dart:io';

void main() {
  // Define a list of questions and their options using maps
  List<Map<String, dynamic>> quizData = [
    {
      'question': 'What is the capital of France?',
      'options': ['A. London', 'B. Paris', 'C. Berlin', 'D. Madrid'],
      'correctAnswer': 'B',
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'options': ['A. Mars', 'B. Venus', 'C. Earth', 'D. Jupiter'],
      'correctAnswer': 'A',
    },
    {
      'question': 'What is the largest mammal in the world?',
      'options': ['A. Elephant', 'B. Blue Whale', 'C. Giraffe', 'D. Lion'],
      'correctAnswer': 'B',
    },
  ];

  int score = 0;

  print('Welcome to the Quiz App!\n');

  for (int i = 0; i < quizData.length; i++) {
    Map<String, dynamic> questionData = quizData[i];

    print('Question ${i + 1}: ${questionData['question']}');

    for (int j = 0; j < questionData['options'].length; j++) {
      print('${questionData['options'][j]}');
    }

    stdout.write('Your answer (A-D): ');
    String userAnswer = stdin.readLineSync()!.toUpperCase();

    if (userAnswer == questionData['correctAnswer']) {
      print('Correct!\n');
      score++;
    } else {
      print('Incorrect. The correct answer is: ${questionData['correctAnswer']}\n');
    }
  }

  print('Quiz completed! Your score: $score out of ${quizData.length}');
}
