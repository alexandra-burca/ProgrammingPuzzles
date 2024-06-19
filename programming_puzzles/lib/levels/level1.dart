import 'package:flutter/material.dart';
import 'package:programming_puzzles/navigation/nav.dart';
import 'package:programming_puzzles/widgets/questions.dart';
import 'package:programming_puzzles/widgets/route.dart';

class Level1 extends StatefulWidget {
  @override
  _Level1State createState() => _Level1State();
}

class _Level1State extends State<Level1> {
  List<QuizItem> quizItems = [
    StaticScreen(
      text: 'Un algoritm este un set finit de instructiuni clare, care se executa într-o ordine bine precizată, pentru rezolvarea unei probleme.',
    ),

    StaticScreen(
      text: 'Există multe limbaje de programare, dar mai întai trebuie să învățăm operațiile de bază pe care toate le au in comun. Limbaje de programare: C/C++, Python, Java, Pascal',  
    ),

    StaticScreen(
      text: 'Haide să vedem cum funcționează câteva operații elementare: Operatorul de atribuire',
    ),

    Question(
      text: 'Ce semnifica x ← 5 ?',
      answers: ['x+5', 'x^5', 'x=5', 'x/5'],
      correctIndex: 2,
    ),
    StaticScreen(
      text: 'Corect! Vom spune că variabilei x îi este atribuită valoarea 5',
    ),

    StaticScreen(
      text: 'Acestia sunt operatorii aritmetici ce ii cunosti deja:\nadunare +\nscadere -\ninmultire *\nimpartire /',
    ),

    Question(
      text: 'Se semnifica operatorul MOD?',
      answers: ['adunare', 'scadere', 'inmultire', 'catul impartirii'],
      correctIndex: 3,
      ),

    Question(
      text: 'Se semnifica operatorul MOD?',
      answers: ['restul impartirii', 'impartire', 'putere', 'fractie',],
      correctIndex: 0,
      ),

    StaticScreen(
        text: 'Iata un exemplu pentru aceste operatii:\n 13 / 2 = 6 rest 1\n deci,\n 13 DIV 2 = 6\n 13 MOD 2 = 1'),

    StaticScreen(
      text: 'Operatori relationali:\n <   mai mic\n >    mai mare\n<=    mai mic sau egal\n>=    mai mare sau egal\n=   egal\n<>   diferit'
      ),    

    StaticScreen(
      text:'Operatoti logici:\nNOT   negatie\nAND    si logic\nOR    sau logic'),

    TextBoxQuestion(
      question: 'What is the capital of France?',
      correctAnswer: 'Paris',
      hint: 'It is also known as the city of light.',
    ),
    
    FinalScreen(
      text: 'Felicitari, ai completat cu succes lectia!',
    ),
    
  ];

    int currentQuizItemIndex = 0;
  int? selectedAnswerIndex;
  bool isAnswerCorrect = false;
  String userAnswer = '';
  bool isTextBoxAnswerCorrect = false;
  bool showErrorMessage = false;

  void checkAnswer(int index) {
    setState(() {
      selectedAnswerIndex = index;
      isAnswerCorrect = index == (quizItems[currentQuizItemIndex] as Question).correctIndex;
    });
  }

  void checkTextBoxAnswer() {
    setState(() {
      TextBoxQuestion currentTextBoxQuestion = quizItems[currentQuizItemIndex] as TextBoxQuestion;
      if (userAnswer.toLowerCase() == currentTextBoxQuestion.correctAnswer.toLowerCase()) {
        isTextBoxAnswerCorrect = true;
        showErrorMessage = false;
        // Add any other logic for correct answer here
      } else {
        isTextBoxAnswerCorrect = false;
        showErrorMessage = true;
      }
    });
  }

  void goToNextItem() {
    setState(() {
      currentQuizItemIndex++;
      selectedAnswerIndex = null;
      isAnswerCorrect = false;
      userAnswer = '';
      isTextBoxAnswerCorrect = false;
      showErrorMessage = false;
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
              const SizedBox(height: 100),
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
              
              SizedBox(height: 50),
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
    } 
    
    
    
    else if (currentQuizItem is StaticScreen) {
      StaticScreen currentStaticScreen = currentQuizItem as StaticScreen;
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              const SizedBox(height: 120),

              Text(
                currentStaticScreen.text,
                style: TextStyle(fontSize: 24, fontFamily: "Poppins"),
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
    } 
    
    
    else if (currentQuizItem is TextBoxQuestion) {
      TextBoxQuestion currentTextBoxQuestion = currentQuizItem as TextBoxQuestion;
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 120),
              Text(
                currentTextBoxQuestion.question,
                style: TextStyle(fontSize: 26, fontFamily: 'Poppins'),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 50),

              Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0), // Adjust the horizontal padding as needed
              child: TextField(
                onChanged: (value) {
                  userAnswer = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Introdu raspunsul',
                ),
              ),
            ),

              SizedBox(height: 70),

              ElevatedButton(
                onPressed: checkTextBoxAnswer,

                child: Text('Verifica'),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[200],
                foregroundColor: Colors.black, 
                fixedSize: Size(260, 58),
                textStyle: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Poppins',
                
                ),
                ),

              ),
              if (showErrorMessage)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Raspuns gresit. Mai incearca!',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),


              if (isTextBoxAnswerCorrect)

                SizedBox(height: 160),
              Visibility(
                visible: isTextBoxAnswerCorrect,
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
    } 
    
    
    else if (currentQuizItem is FinalScreen) {
      FinalScreen currentFinalScreen = currentQuizItem as FinalScreen;
      return Scaffold(
       
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              const SizedBox(height: 80),
              Text(
                currentFinalScreen.text,
                style: TextStyle(fontSize: 24, fontFamily: "Poppins",),
                textAlign: TextAlign.center,
                
              ),
              const SizedBox(height: 70),

            Image.asset(
              'assets/images/boybook.png', 
              width: 230,
              height: 230,
            ),
            const SizedBox(height: 100),


              ElevatedButton(
            
                onPressed: () {
                Navigator.push(
                  context,
                  createRoute(CustomBottomNavigationBar()),
                );
          
              },
             
              child: Text('Inapoi la meniu'),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[300],
                foregroundColor: Colors.black, 
                fixedSize: Size(260, 58),
                textStyle: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Poppins',
                
                ),
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

