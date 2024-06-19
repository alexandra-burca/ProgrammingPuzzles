import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 50),

          // Add margin to the "Portofoliu" text
          Padding(
            padding: const EdgeInsets.only(left: 90.0),
            child: const Text(
              'Portofoliu',
              style: TextStyle(
                fontSize: 45, 
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 40),

          WordBox(word: 'Algoritm', definition: 'Un set finit de instrucțiuni clare, care se execută într-o ordine bine stabilită, pentru rezolvarea unei probleme.'),
          WordBox(word: 'Variabilă', definition: 'Un simbol utilizat pentru a reprezenta entitatea în care este stocată o valoare. Această valoare poate fi modificată în timpul execuției unui program. Variabilele sunt folosite pentru a reține date care pot fi utilizate și manipulate de algoritmi.'),
          WordBox(word: 'Valoare', definition: 'Informație stocată într-o variabilă, cum ar fi un număr, un caracter sau o altă dată.'),
          WordBox(word: 'Pseudocod', definition: 'Un mod de a descrie un algoritm folosind un limbaj simplificat, asemănător limbajului natural, pentru a ușura înțelegerea logicii programului.'),
          WordBox(word: 'Operatori numerici', definition: 'Simboluri folosite pentru a efectua operații matematice, cum ar fi adunarea (+), scăderea (-), înmulțirea (*) și împărțirea (/)'),
          WordBox(word: 'Operatori logici', definition: 'Simboluri folosite pentru a efectua operații logice, cum ar fi "și" (AND), "sau" (OR) și "nu" (NOT)'),
          WordBox(word: 'Structura liniară', definition: ' Instrucțiunile se execută una după alta, în ordine.  '),
          WordBox(word: 'Structura decizională', definition: 'Se iau decizii pe baza unor condiții, cum ar fi folosirea instrucțiunii "if".'),
          WordBox(word: 'Structura repetitivă', definition: 'Cunoscută și sub numele de buclă (loop), este o secțiune de cod care se execută în mod repetat, fie un număr fix de ori, fie până când o anumită condiție este îndeplinită.'),
          WordBox(word: 'Interschimbare', definition: 'Procesul de schimbare a valorilor între două variabile.'),
          WordBox(word: 'Minim/Maxim', definition: 'Găsirea celei mai mici sau celei mai mari valori dintr-un set de date. Acesta se găsește prin comparări repetate.'),
          WordBox(word: 'Prelucrare cifre', definition: 'Operații efectuate pe cifre individuale ale unui număr, cum ar fi extragerea cifrelor sau transformarea lor.'), 
        ],
      ),
    );
  }
}

class WordBox extends StatelessWidget {
  final String word;
  final String definition;

  WordBox({required this.word, required this.definition});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DefinitionPage(word: word, definition: definition),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.yellow[400],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            word,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,       
              fontFamily: 'RobotoMono',
            ),
          ),
        ),
      ),
    );
  }
}

class DefinitionPage extends StatelessWidget {
  final String word;
  final String definition;

  DefinitionPage({required this.word, required this.definition});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(word),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            definition,
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
