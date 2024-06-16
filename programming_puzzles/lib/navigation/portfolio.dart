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

          WordBox(word: 'Algoritm', definition: 'A process or set of rules to be followed in calculations or other problem-solving operations, especially by a computer.'),
          WordBox(word: 'Variabilă', definition: 'A system of numerical notation that has 2 rather than 10 as a base.'),
          WordBox(word: 'Valoare', definition: 'A hardware or software component that stores data so future requests for that data can be served faster.'),
          WordBox(word: 'Pseudocod', definition: 'A system of numerical notation that has 2 rather than 10 as a base.'),
          WordBox(word: 'Operatori numerici', definition: 'A system of numerical notation that has 2 rather than 10 as a base.'),
          WordBox(word: 'Operatori logici', definition: 'A system of numerical notation that has 2 rather than 10 as a base.'),
          WordBox(word: 'Structura liniară', definition: 'A system of numerical notation that has 2 rather than 10 as a base.'),
          WordBox(word: 'Structura decizională', definition: 'A system of numerical notation that has 2 rather than 10 as a base.'),
          WordBox(word: 'Structura alternativă', definition: 'A system of numerical notation that has 2 rather than 10 as a base.'),
          WordBox(word: 'Interschimbare', definition: 'A system of numerical notation that has 2 rather than 10 as a base.'),
          WordBox(word: 'Minim/Maxim', definition: 'A system of numerical notation that has 2 rather than 10 as a base.'),
          WordBox(word: 'Prelucrare cifre', definition: 'A system of numerical notation that has 2 rather than 10 as a base.'), 
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
