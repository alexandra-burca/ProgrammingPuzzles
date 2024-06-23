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
      text: 'Aceștia sunt operatorii aritmetici ce îi cunoști deja:\nadunare +\nscădere -\nînmulțire *\nîmpărțire /',
    ),

    Question(
      text: 'Se semnifică operatorul MOD?',
      answers: ['adunare', 'scădere', 'înmulțire', 'câtul împărțirii'],
      correctIndex: 3,
      ),

    Question(
      text: 'Se semnifică operatorul MOD?',
      answers: ['restul împărțirii', 'împărțire', 'putere', 'fracție',],
      correctIndex: 0,
      ),

    StaticScreen(
        text: 'Iată un exemplu pentru aceste operații:\n 13 / 2 = 6 rest 1\n deci,\n 13 DIV 2 = 6\n 13 MOD 2 = 1'),

    StaticScreen(
      text: 'Operatori relaționali:\n <   mai mic\n >    mai mare\n<=    mai mic sau egal\n>=    mai mare sau egal\n=   egal\n<>   diferit'
      ),    

    StaticScreen(
      text:'Operatoti logici:\nNOT   negatie\nAND    și logic\nOR    sau logic'),

    

    TextBoxQuestion(
      question: 'Ești aproape de finalul lecției! Rezolvă acest exercițiu.\n 12-(7 DIV 2)+(3 MOD 4)=',
      correctAnswer: '8',
      hint: 'Ai grija la ordinea operațiilor',
    ),

    StaticScreen(text: 'Corect! Ai urmat și tu acești pași?\n 7 DIV 2 = 5\n 3 MOD 4 = 1\n 12 - 5 + 1 = 8'),
    
    FinalScreen(
      text: 'Felicitări, ai completat cu succes lecția! Poți verifica cunoștințele dobândite în portofoliu.',
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
        body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
          
                
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

              SizedBox(height: 50),

              ElevatedButton(
                onPressed: checkTextBoxAnswer,

                child: Text('Verifică'),
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
                    'Raspuns greșit. Mai incearcă!',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),


              if (isTextBoxAnswerCorrect)

                SizedBox(height: 140),
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
              ]
    
          ),
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
             
              child: Text('Înapoi la meniu'),
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

