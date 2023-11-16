import 'dart:io';

class Quiz {
  List<Question> questions;
  int currentQuestionIndex = 0;
  int score = 0;

  Quiz(List<Question> questions) : questions = questions {
    this.questions = questions;
  }

  void startQuiz() {
    print("Welcome to the Quiz!");
    print("Let's get started.\n");
    askQuestion();
  }

  void askQuestion() {
    if (currentQuestionIndex < questions.length) {
      Question currentQuestion = questions[currentQuestionIndex];
      print("Question ${currentQuestionIndex + 1}: ${currentQuestion.text}");

      // Use letters A, B, C, and D for options.
      List<String> optionLabels = ['A', 'B', 'C', 'D'];
      for (int i = 0; i < currentQuestion.options.length; i++) {
        print("${optionLabels[i]}. ${currentQuestion.options[i]}");
      }

      stdout.write("Your answer (A-D): ");
      String userAnswer = stdin
          .readLineSync()!
          .toUpperCase(); // Convert to uppercase for consistency.

      //using  the optionLabels list to map letter options to their respective indices in the
      // options list (better for user experience and improved feedback)
      int correctIndex = optionLabels.indexOf(currentQuestion.correctAnswer);

      if (userAnswer == optionLabels[correctIndex]) {
        print("Correct!\n");
        score++;
      } else {
        print(
            "Incorrect. The correct answer is ${optionLabels[correctIndex]}. ${currentQuestion.options[correctIndex]}\n");
      }

      //Direct way of comparing for simplicity
      // if (userAnswer == currentQuestion.correctAnswer) {
      //   print("Correct!\n");
      //   score++;
      // } else {
      //   print("Incorrect. The correct answer is ${currentQuestion.correctAnswer}\n");
      // }

      currentQuestionIndex++;
      askQuestion();
    } else {
      endQuiz();
    }
  }

  void viewResults() {
    print("Your Quiz Score: $score/${questions.length}");
  }

  void endQuiz() {
    print("Quiz completed. Here are your results:");
    viewResults();
  }
}

class Question {
  String text;
  List<String> options;
  String correctAnswer;

  Question(String text, List<String> options, String correctAnswer)
      : text = text,
        options = options,
        correctAnswer = correctAnswer {
    this.text = text;
    this.options = options;
    this.correctAnswer = correctAnswer;
  }
}

void main() {
  List<Question> quizQuestions = [
    Question("What is the capital of France?",
        ["London", "Berlin", "Madrid", "Paris"], "D"),
    Question("Which planet is known as the Red Planet?",
        ["Mars", "Earth", "Venus", "Jupiter"], "A"),
    Question("What is the largest mammal in the world?",
        ["Elephant", "Giraffe", "Blue Whale", "Kangaroo"], "C"),
  ];

  Quiz quiz = Quiz(quizQuestions);

  while (true) {
    print("Enter a command: ");
    print("1. Start Quiz");
    print("2. Next Question");
    print("3. View Results");
    print("4. End Quiz");
    print("5. Quit");
    stdout.write("Your choice (1-5): ");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        quiz.startQuiz();
        break;
      case 2:
        quiz.askQuestion();
        break;
      case 3:
        quiz.viewResults();
        break;
      case 4:
        quiz.endQuiz();
        break;
      case 5:
        exit(0);
      default:
        print("Invalid choice. Please choose a valid option.");
    }
  }
}
