import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background image
            Image.asset(
              'assets/images/map.jpg', // Replace with your background image path
              
              width: MediaQuery.of(context).size.width,
              repeat: ImageRepeat.repeatY,
            ),

            // Overlay with repeatable image
          // Select a level widget
          Positioned(
            top: 70.0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.red.shade200.withOpacity(0.7), // Semi-transparent black color
              child: Center(
                child: Text(
                  'Selectează un nivel',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
            // Overlay with level buttons
            Positioned(
              top: 140,
              bottom: 0, 
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: List.generate(
                    10, // Number of levels
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to the level screen for the selected level
                          Navigator.pushNamed(context, '/level', arguments: index + 1);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 14.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle, // Shape of the level buttons
                          ),
                          width: 70.0, // Diameter of the level buttons
                          height: 70.0,
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontFamily: "PressStart2P",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
