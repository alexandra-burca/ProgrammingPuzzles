import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 3, // Set a height that accommodates all content
          child: Stack(
            children: [
              Positioned(
                top: 34.0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(30.0),
              
                  child: Center(
                    child: Text(
                      'test',
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
                top: 130,
                left: 0,
                right: 0,
                child: Center(
                  child: Column(
            
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
