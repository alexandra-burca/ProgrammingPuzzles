import 'package:flutter/material.dart';

class Level1Slide1 extends StatefulWidget {
  @override
  _Level1Slide1State createState() => _Level1Slide1State();
}


class _Level1Slide1State extends State<Level1Slide1> {
  List<QuizItem> quizItems = [
    StaticScreen(
      text: 'Un algoritm este un set finit de instructiuni clare, care se executa într-o ordine bine precizată, pentru rezolvarea unei probleme.',
    ),

    StaticScreen(
      text: 'Exista multe limbaje de programare, dar mai intai trebuie sa invatam operatiile de baza pe care toate le au in comun. Limbaj de programare: C/C++, Python, Java, Pascal',  
    ),

    StaticScreen(
      text: 'Haide sa vedem cum functioneaza cateva operatii elementare: Operatorul de atribuire',
    ),

    Question(
      text: 'Ce semnifica x ← 5',
      answers: ['x+5', 'x^5', 'x=5', 'x/5'],
      correctIndex: 2,
    ),
    StaticScreen(
      text: 'Corect! Variabilei x ii este atribuita valoarea 5',
    ),
    
    StaticScreen(
      text: 'Felicitari, ai completat cu succes lectia!',
    ),
    
  ];

  int currentQuizItemIndex = 0;
  int? selectedAnswerIndex;
  bool isAnswerCorrect = false;

  void checkAnswer(int index) {
    setState(() {
      selectedAnswerIndex = index;
      isAnswerCorrect = index == (quizItems[currentQuizItemIndex] as Question).correctIndex;
    });
  }

  void goToNextItem() {
    setState(() {
      currentQuizItemIndex++;
      selectedAnswerIndex = null;
      isAnswerCorrect = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    QuizItem currentQuizItem = quizItems[currentQuizItemIndex];

    if (currentQuizItem is Question) {
      Question currentQuestion = currentQuizItem as Question;
      return Scaffold(
       
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 150),

              Text(
                currentQuestion.text,
                style: TextStyle(fontSize: 26, fontFamily: 'Poppins'),
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
                      decoration: BoxDecoration(
                        color: selectedAnswerIndex == index
                            ? (isAnswerCorrect ? Colors.green : Colors.red)
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Text(
                        currentQuestion.answers[index],
                        style: TextStyle(fontSize: 28, fontFamily: 'Poppins'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
              if (isAnswerCorrect)
              SizedBox(height: 30),

                Visibility(
              visible: isAnswerCorrect,
              child: TextButton(
                onPressed: goToNextItem,
                child: Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.pink[300],
                  size: 100,
                ),
              ),
                ),
            ],
          ),
        ),
      );
    } else if (currentQuizItem is StaticScreen) {
      StaticScreen currentStaticScreen = currentQuizItem as StaticScreen;
      return Scaffold(
       
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              const SizedBox(height: 200),
              Text(
                currentStaticScreen.text,
                style: TextStyle(fontSize: 24, fontFamily: "Poppins",),
                textAlign: TextAlign.center,
                
              ),
              const SizedBox(height: 100),

              TextButton(
                onPressed: goToNextItem,
                child: Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.pink[300],
                size: 100,
              ),

              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}

abstract class QuizItem {}

class Question extends QuizItem {
  final String text;
  final List<String> answers;
  final int correctIndex;

  Question({
    required this.text,
    required this.answers,
    required this.correctIndex,
  });
}

class StaticScreen extends QuizItem {
  final String text;

  StaticScreen({required this.text});
}

