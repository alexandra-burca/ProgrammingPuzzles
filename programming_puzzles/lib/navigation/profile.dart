import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150),
            Image.asset(
              'assets/images/robot.png',
              height: 270,
              width: 270,
            ),
            SizedBox(height: 170),
            
   
          ],
        ),
      ),
    );
  }
}