import 'package:flutter/material.dart';

class Level1Slide1 extends StatefulWidget {
  @override
  _Level1Slide1State createState() => _Level1Slide1State();
}

class _Level1Slide1State extends State<Level1Slide1> {
  List<Question> questions = [
    Question(
      text: 'What is the capital of France?',
      answers: ['Berlin', 'Madrid', 'Paris', 'Lisbon'],
      correctIndex: 2,
    ),
    // Add more questions here
  ];

  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool isAnswerCorrect = false;

  void checkAnswer(int index) {
    setState(() {
      selectedAnswerIndex = index;
      isAnswerCorrect = index == questions[currentQuestionIndex].correctIndex;
    });
  }

  void goToNextQuestion() {
    setState(() {
      currentQuestionIndex++;
      selectedAnswerIndex = null;
      isAnswerCorrect = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              currentQuestion.text,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: currentQuestion.answers.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => checkAnswer(index),
                  child: Container(
                    alignment: Alignment.center,
                    color: selectedAnswerIndex == index
                        ? (isAnswerCorrect ? Colors.green : Colors.red)
                        : Colors.grey[300],
                    child: Text(
                      currentQuestion.answers[index],
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
            if (isAnswerCorrect)
              ElevatedButton(
                onPressed: currentQuestionIndex < questions.length - 1
                    ? goToNextQuestion
                    : () {
                        // Handle end of quiz
                      },
                child: Text('Next Question'),
              ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> answers;
  final int correctIndex;

  Question({
    required this.text,
    required this.answers,
    required this.correctIndex,
  });
}
