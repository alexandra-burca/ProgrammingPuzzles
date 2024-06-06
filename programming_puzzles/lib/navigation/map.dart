import 'package:flutter/material.dart';
import 'package:programming_puzzles/levels/level1.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap the Column in SingleChildScrollView
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70), // Add space between boxes
            
              Padding(
                padding: EdgeInsets.all(20.0),
                
                child: Text(
                  'Capitolul 1: Introducere',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 20), // Add space between boxes
              Box_One(
                onTap: () {
                  // Navigate to the Level1Slide1 screen when box is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level1Slide1()),
                  );
                },
              ),
              
              SizedBox(height: 20), // Add space between boxes
              Box_Two(
                onTap: () {
                  // Navigate to the Level1Slide1 screen when box is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level1Slide1()),
                  );
                },
              ),
              
              SizedBox(height: 20), // Add space between boxes
              Box_Three(
                onTap: () {
                  // Navigate to the Level1Slide1 screen when box is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level1Slide1()),
                  );
                },
              ),
              
              SizedBox(height: 30), // Add space between boxes
            
              Padding(
                padding: EdgeInsets.all(20.0),
                
                child: Text(
                  'Capitolul 2: Functii',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              

              SizedBox(height: 20), // Add space between boxes
              Box_Four(
                onTap: () {
                  // Navigate to the Level1Slide1 screen when box is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level1Slide1()),
                  );
                },
              ),
              
              SizedBox(height: 20), // Add space between boxes
              Box_Five(
                onTap: () {
                  // Navigate to the Level1Slide1 screen when box is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level1Slide1()),
                  );
                },
              ),
              
              SizedBox(height: 20), // Add space between boxes
              Box_Six(
                onTap: () {
                  // Navigate to the Level1Slide1 screen when box is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level1Slide1()),
                  );
                },
              ),
              
              SizedBox(height: 20), // Add space between boxes
              Box_Seven(
                onTap: () {
                  // Navigate to the Level1Slide1 screen when box is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level1Slide1()),
                  );
                },
              ),
              
              SizedBox(height: 20), // Add space between boxes
              Box_Eight(
                onTap: () {
                  // Navigate to the Level1Slide1 screen when box is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level1Slide1()),
                  );
                },
              ),
              
              SizedBox(height: 20), // Add space between boxes
              Box_Nine(
                onTap: () {
                  // Navigate to the Level1Slide1 screen when box is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level1Slide1()),
                  );
                },
              ),
              
              SizedBox(height: 20), // Add space between boxes
              Box_Ten(
                onTap: () {
                  // Navigate to the Level1Slide1 screen when box is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level1Slide1()),
                  );
                },
              ),
              
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class Box_One extends StatelessWidget {
  final VoidCallback onTap; // Callback function for onTap

  const Box_One({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call the onTap callback when the box is tapped
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.teal[400],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            'Lectia 1',
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 18.0,
              fontFamily: 'PressStart2P',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Box_Two extends StatelessWidget {

  final VoidCallback onTap; // Callback function for onTap

  const Box_Two({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call the onTap callback when the box is tapped
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.teal[300],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            'Lectia 2',
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 18.0,
              fontFamily: 'PressStart2P',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Box_Three extends StatelessWidget {
  final VoidCallback onTap; // Callback function for onTap

  const Box_Three({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call the onTap callback when the box is tapped
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.teal[400],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            'Lectia 3',
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 18.0,
              fontFamily: 'PressStart2P',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Box_Four extends StatelessWidget {
  final VoidCallback onTap; // Callback function for onTap

  const Box_Four({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call the onTap callback when the box is tapped
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.teal[300],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            'Lectia 4',
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 18.0,
              fontFamily: 'PressStart2P',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Box_Five extends StatelessWidget {
  final VoidCallback onTap; // Callback function for onTap

  const Box_Five({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call the onTap callback when the box is tapped
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.teal[400],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            'Lectia 5',
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 18.0,
              fontFamily: 'PressStart2P',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Box_Six extends StatelessWidget {
  final VoidCallback onTap; // Callback function for onTap

  const Box_Six({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call the onTap callback when the box is tapped
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.teal[300],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            'Lectia 6',
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 18.0,
              fontFamily: 'PressStart2P',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Box_Seven extends StatelessWidget {
  final VoidCallback onTap; // Callback function for onTap

  const Box_Seven({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call the onTap callback when the box is tapped
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.teal[400],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            'Lectia 7',
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 18.0,
              fontFamily: 'PressStart2P',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Box_Eight extends StatelessWidget {
  final VoidCallback onTap; // Callback function for onTap

  const Box_Eight({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call the onTap callback when the box is tapped
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.teal[300],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            'Lectia 8',
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 18.0,
              fontFamily: 'PressStart2P',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Box_Nine extends StatelessWidget {
  final VoidCallback onTap; // Callback function for onTap

  const Box_Nine({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call the onTap callback when the box is tapped
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.teal[400],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            'Lectia 9',
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 18.0,
              fontFamily: 'PressStart2P',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Box_Ten extends StatelessWidget {
  final VoidCallback onTap; // Callback function for onTap

  const Box_Ten({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call the onTap callback when the box is tapped
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.teal[300],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            'Lectia 10',
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 18.0,
              fontFamily: 'PressStart2P',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}




