import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:programming_puzzles/screens/map.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70),
              Image.asset(
                'assets/images/register.png', // Replace with your image path
                height: 250,
                width: 250,
              ),
              SizedBox(height: 20),
              // Register text
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              // Text fields for name, email, and password
              _buildTextField('Nume', 'Introdu numele aici', controller: nameController),
              SizedBox(height: 10),
              _buildTextField('Email', 'Introdu email-ul aici', controller: emailController),
              SizedBox(height: 10),
              _buildTextField('Parola', 'Introdu parola aici', isPassword: true, controller: passwordController),
              SizedBox(height: 20),
              
              SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  registerUser(nameController.text, emailController.text, passwordController.text);
                },
                child: Text('Creare cont'),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan[200],
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
      ),
    );
  }

  

  Widget _buildTextField(String label, String hint, {bool isPassword = false, required TextEditingController controller}) {
    return TextField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}


Future<void> registerUser(String name, String email, String password) async {
  final Uri uri = Uri.parse('http://your-backend-server.com/register'); // Replace with your backend endpoint

  try {
    final response = await http.post(
      uri,
      body: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Registration successful, navigate to main screen
      // You may also store user data locally using shared preferences
      Navigator.pushReplacement(
        context as BuildContext,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } else {
      // Registration failed, handle error
      print('Registration failed: ${response.body}');
      // Display error message to the user
    }
  } catch (e) {
    // Handle network or server errors
    print('Error registering user: $e');
    // Display error message to the user
  }
}
