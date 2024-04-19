import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_puzzles/navigation/map.dart';

class LoginScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObscure = true.obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 90),
            Image.asset(
              'assets/images/login.png', 
              width: 270,
              height: 270,
            ),
            SizedBox(height: 30),
            
            Text(
              'Login',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            // Textboxes for email and password
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column (
                      children: [
                        //email
                        TextFormField(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                          controller: emailController,
                          validator: (val) => val == "" ? "Trebuie sa introduci email-ul" : null,
                          decoration: InputDecoration(
                            prefixIcon: const Icon (
                              Icons.email,
                              color: Colors.teal,
                            ),
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            contentPadding: const EdgeInsets.all(18),
                          ),
                        ),

                        SizedBox(height: 15),

                        Obx(
                          () => TextFormField(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                          controller: passwordController,
                          obscureText: isObscure.value,
                          validator: (val) => val == "" ? "Trebuie sa introduci parola" : null,
                          decoration: InputDecoration(
                            prefixIcon: const Icon (
                              Icons.password,
                              color: Colors.teal,
                              
                            ),
                            suffixIcon: Obx(
                              ()=> GestureDetector(
                                onTap: ()
                                {
                                  isObscure.value = !isObscure.value;

                                },
                                child: Icon(
                                  isObscure.value ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.teal[200],
                                )
                              ),
                              ),
                            hintText: "Parolă",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                          ),
                            contentPadding: const EdgeInsets.all(18),
                          ),
                        ),
                          
                          ),

                      ],
                      ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 110),
            // Button for login process
            ElevatedButton(
            
                onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen()),
                );
          
              },
                     
              child: Text('Intră în cont'),
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
          ],
        ),
          )
        
      ),
    );
  }
  
}
