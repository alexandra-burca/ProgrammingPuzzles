import 'package:flutter/material.dart';

class LevelFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              'Nivelul 5',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
