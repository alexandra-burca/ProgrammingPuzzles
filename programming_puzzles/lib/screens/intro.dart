import 'package:flutter/material.dart';
import 'package:programming_puzzles/screens/login.dart';
import 'package:programming_puzzles/screens/register.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 110),
            Image.asset(
              'assets/images/intro1.png',
              height: 270,
              width: 270,
            ),
            SizedBox(height: 25),
            Text(
              'Programming',
                style: TextStyle(
                fontFamily: 'PressStart2P',
                fontSize: 30,
              
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Puzzles',
                style: TextStyle(
                fontFamily: 'PressStart2P',
                fontSize: 30,
              
              ),
            ),

            SizedBox(height: 170),
            
            ElevatedButton(
                  
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
              },
              child: Text('Continuă'),
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black, 
                fixedSize: Size(260, 58),
                textStyle: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
   
          ],
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Image.asset(
              'assets/images/intro2.png',
              height: 300,
              width: 300,
            ),
            SizedBox(height: 20),
            Text(
              'Învață informatica de la zero',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'oriunde și oricând',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Vrei să dobândești cât mai multe",
              style: TextStyle(
                fontFamily: 'Poppins',  
                fontSize: 16,
              ),
            ),
            Text(
              "cunoștințe în domeniul informaticii?",
              style: TextStyle(
                fontFamily: 'Poppins',  
                fontSize: 16,
              ),
            ),
            Text(
              "Cu aceste lecții simple vei învăța ",
              style: TextStyle(
                fontFamily: 'Poppins',  
                fontSize: 16,
              ),
            ),
            Text(
              "să gândești ca un programator adevarat.",
              style: TextStyle(
                fontFamily: 'Poppins',  
                fontSize: 16,
              ),
            ),
            SizedBox(height: 110),

            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
              ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
          
              },
              child: Text('Cont nou'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[200],
                foregroundColor: Colors.black, 
                fixedSize: Size(170, 58),
                textStyle: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),
              SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
          
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[200],
                foregroundColor: Colors.black, 
                fixedSize: Size(170, 58),
                textStyle: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),
            ]

            )
            
          ],
        ),
      ),
    );
  }
}
